//
//  ChatView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import SwiftUI
import Foundation

struct ChatView: View {
    
    var chatAllData: [ChatResponse] = chatData
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    VStack(spacing: 20){
                        HStack{
                            Text("Brodcase List")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.primaryColor)
                            Spacer()
                            Text("New Group")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.primaryColor)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        LazyVStack{
                            ForEach(chatAllData){ item in
                                NavigationLink(destination: ChatDetailView(chatResponse: item)){
                                    VStack(spacing: 5) {
                                        ChatViewRows(chatResponse: item)
                                            .padding(.horizontal)
                                        Divider()
                                            .padding(.leading, 100)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        
                    }label: {
                        Text("Edit")
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 20) {
                        Button{
                            
                        }label: {
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 20)
                        }
                    }
                }
            }
        }
    }
}

#Preview{
    ChatView()
}



let currentUserData:UserResponse = UserResponse(id: UUID(),
                                                name: "Jane Smith",
                                                profileUrl: "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
let userData: [UserResponse] = [
        UserResponse(id: UUID(), name: "John Doe", profileUrl: "https://images.pexels.com/photos/4855376/pexels-photo-4855376.jpeg"),
        UserResponse(id: UUID(), name: "Alice Johnson", profileUrl: "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=600"),
        UserResponse (id: UUID(), name: "+1 234 567 8901", profileUrl: "https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=600"),
        UserResponse (id: UUID(), name: "+1 111 481 8211", profileUrl: "https://images.pexels.com/photos/5951718/pexels-photo-5951718.jpeg"),
        UserResponse (id: UUID(), name: "+1 928 931 7732", profileUrl: "https://images.pexels.com/photos/1310474/pexels-photo-1310474.jpeg?auto=compress&cs=tinysrgb&w=600"),
        UserResponse(id: UUID(), name: "Bob Brown", profileUrl: "https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=600"),
        UserResponse (id: UUID(), name: "+1 172 654 8271", profileUrl: "https://images.pexels.com/photos/1499327/pexels-photo-1499327.jpeg?auto=compress&cs=tinysrgb&w=600"),
        UserResponse(id: UUID(), name: "+1 134 093 7087", profileUrl: "https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=600")
    ]


let chatData:[ChatResponse] = [
        ChatResponse(id: UUID(), user: userData[0], text: "Hello", badgeNumber: nil, type: 1, timeAgo: "Yesterday"),
        ChatResponse(id: UUID(), user: userData[1], text: "Missed voice call", badgeNumber: 1, type: 2, timeAgo: "5m"),
        ChatResponse(id: UUID(), user: userData[2], text: "Let's Bounce", badgeNumber: nil, type: 1, timeAgo: "10m"),
        ChatResponse(id: UUID(), user: userData[3], text: "0:05", badgeNumber: 2, type: 3, timeAgo: "Saturday"),
        ChatResponse(id: UUID(), user: userData[4], text: "Kaise ho?", badgeNumber: 2, type: 1, timeAgo: "Sunday"),
        ChatResponse(id: UUID(), user: userData[5], text: "Happy birthday", badgeNumber: 1, type: 1, timeAgo: "25m"),
        ChatResponse(id: UUID(), user: userData[6], text: "01:23", badgeNumber: nil, type: 3, timeAgo: "10m"),
        ChatResponse(id: UUID(), user: userData[7], text: "Missed voice call", badgeNumber: 3, type: 2, timeAgo: "2h"),
    ]

