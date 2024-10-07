//
//  ChatApplicationApp.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import SwiftUI

@main
struct ChatApplicationApp: App {
    
    @StateObject var socketManager = SocketIOManager()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(socketManager)
        }
    }
}
