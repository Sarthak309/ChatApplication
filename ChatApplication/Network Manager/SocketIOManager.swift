//
//  WebSocketClient.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//

import Foundation
import Logger
import SocketIO

class SocketIOManager: ObservableObject {
    private var manager: SocketManager!
    private var socket: SocketIOClient!
    
    @Published var isConnected: Bool = false
    @Published var unreadCount: Int = 0
    @Published var isTypingUser: String = ""  // To store which user is typing
    @Published var errorMessage: String?      // To store error messages
    @Published var newMessage: String = ""    // To store new message content
    @Published var chatListUpdate: [String: Any] = [:]
    
    
    // MARK: - Setup
    func setupSocket() {
        
        let token = UserPreferences().jwt ?? ""
        
        // Setup SocketManager with the HTTP URL and pass the token via query params
        manager = SocketManager(socketURL: URL(string: AppConfiguration().apiBaseUrl)!, config: [
            .log(true),
            .compress,
            .extraHeaders(["Authorization": "Bearer \(token)"])
        ])
        
        socket = manager.defaultSocket
        
        // Handle connection events
        socket.on(clientEvent: .connect) { data, ack in
            DispatchQueue.main.async {
                self.isConnected = true  // Update state
                self.addSocketListeners()
            }
            Logger.debugPrint("Socket connected")
        }
        
        socket.on(clientEvent: .disconnect) { data, ack in
            DispatchQueue.main.async {
                self.isConnected = false  // Update state
            }
            Logger.debugPrint("Socket disconnected")
        }
        
        socket.on(clientEvent: .error) { data, ack in
            print("Socket error: \(data)")
        }
        
        socket.connect()
        
    }
    
    // MARK: - Socket Functions
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    // Handle message sending
    func sendMessage(event: String, message: String) {
        socket.emit(event, message)
    }
}

// MARK: - Socket Listeners

extension SocketIOManager{
    
    private func addSocketListeners() {
        
        // 'is-typing' event
        socket.on("is-typing") { [weak self] data, ack in
            guard let self = self else { return }
            if let dict = data[0] as? [String: Any],
               let user = dict["user"] as? [String: Any],
               let firstName = user["firstName"] as? String,
               let lastName = user["lastName"] as? String {
                DispatchQueue.main.async {
                    self.isTypingUser = "\(firstName) \(lastName) is typing..."
                    print(self.isTypingUser)
                }
            }
        }
        
        // 'input-error' event
        socket.on("input-error") { [weak self] data, ack in
            guard let self = self else { return }
            if let dict = data[0] as? [String: Any],
               let message = dict["message"] as? String {
                DispatchQueue.main.async {
                    self.errorMessage = "Input error: \(message)"
                    print(self.errorMessage ?? "")
                }
            }
        }
        
        // 'server-error' event
        socket.on("server-error") { [weak self] data, ack in
            guard let self = self else { return }
            if let dict = data[0] as? [String: Any],
               let message = dict["message"] as? String {
                DispatchQueue.main.async {
                    self.errorMessage = "Server error: \(message)"
                    print(self.errorMessage ?? "")
                }
            }
        }
        
        // 'new-message' event
        socket.on("new-message") { [weak self] data, ack in
            guard let self = self else { return }
            if let dict = data[0] as? [String: Any],
               let content = dict["content"] as? String,
               let sender = dict["sender"] as? [String: Any],
               let firstName = sender["firstName"] as? String,
               let lastName = sender["lastName"] as? String {
                DispatchQueue.main.async {
                    self.newMessage = "\(firstName) \(lastName): \(content)"
                    print("New message: \(self.newMessage)")
                }
            }
        }
        
        // 'update-chat-list' event
        socket.on("update-chat-list") { [weak self] data, ack in
            guard let self = self else {
                Logger.debugPrint("No self")
                return
            }
            if let dict = data[0] as? [String: Any],
               let group = dict["group"] as? [String: Any] {
                DispatchQueue.main.async {
                    Logger.debugPrint(dict)
                    self.chatListUpdate = group
                    if let groupName = group["name"] as? String {
                        print("Chat list updated for group: \(groupName)")
                    }
                }
            }
        }
        
        // Listen to the 'total-unread-count' event
        socket.on("total-unread-count") { [weak self] data, ack in
            guard let self = self else { return }
            if let dict = data[0] as? [String: Any],
               let unreadCount = dict["unreadCount"] as? Int {
                DispatchQueue.main.async {
                    self.unreadCount = unreadCount  // Update unread count
                    print("Unread count: \(unreadCount)")
                }
            } else {
                print("Invalid data format for total-unread-count event")
            }
        }
    }
}

// MARK: - Socket Emitters
extension SocketIOManager{
    
    func joinChat(_ message:[String: String]){
        socket.emit("join-chat", message)
    }
    
    func leavechat(_ message: [String: String]){
        socket.emit("leave-chat", message)
    }
    
    func userIsTyping(_ message: Bool){
        socket.emit("is-typing", message)
    }
    
}
