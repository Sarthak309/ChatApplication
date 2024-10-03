//
//  ChatDetailView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//

import SwiftUI

struct ChatDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    var chatConversation: [ChatConversationResponse] = chatConversationData

    
    var chatResponse: ChatResponse
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                Image("chat_background")
                    .resizable()
                    .ignoresSafeArea(edges: .bottom)
                
                ScrollView{
                    VStack{
                        SettingHeaderView()
                            .padding(.vertical, 10)
                        Spacer()
                        
                        LazyVStack(spacing: 10){
                            ForEach(chatConversation){ conversation in
                                BubbleChatView(conversation: conversation)
                                    .padding(.top, 10)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 80)
                
                FooterFloatingView()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.primaryColor)
                                .padding(.top, 4)
                        }
                        
                        ProfileImageView(profileURL: chatResponse.user.profileUrl, size: 40)
                        Text(chatResponse.user.name)
                            .font(.headline)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 20) {
                        Button{
                            
                        }label: {
                            Image(systemName: "video")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                        }
                        .padding(.top, 3)
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "phone")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 22, height: 20)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ChatDetailView(chatResponse: chatData[0])
}



let chatConversationData: [ChatConversationResponse] = [
    ChatConversationResponse(id: UUID(), text: "Hello!", isMe: true, isReaction: nil, dateTime: "10:00 AM"),
    ChatConversationResponse(id: UUID(), text: "Hi! How are you?", isMe: false, isReaction: nil, dateTime: "10:01 AM"),
    ChatConversationResponse(id: UUID(), text: "I'm good, thanks. And you?", isMe: true, isReaction: nil, dateTime: "10:02 AM"),
    ChatConversationResponse(id: UUID(), text: "Doing great! ☺️", isMe: false, isReaction: true, dateTime: "10:03 AM"),
    ChatConversationResponse(id: UUID(), text: "Glad to hear that!", isMe: true, isReaction: nil, dateTime: "10:04 AM"),
    ChatConversationResponse(id: UUID(), text: "Are we still meeting tomorrow?", isMe: false, isReaction: nil, dateTime: "2: 30 PM"),
    ChatConversationResponse(id: UUID(), text: "Yes, at the usual place.", isMe: true, isReaction: nil, dateTime: "2:31 PM"),
    ChatConversationResponse(id: UUID(), text: "See you!", isMe: true, isReaction: true, dateTime: "2:33 PM"),
    ChatConversationResponse(id: UUID(), text: "Can't wait!", isMe: false, isReaction: true, dateTime: "2:34 PM"),
    ChatConversationResponse(id: UUID(), text: "Just a reminder about the documents I emailed you.", isMe: true, isReaction: nil, dateTime: "3:15 PM"),
    ChatConversationResponse(id: UUID(), text: "Got them, I'll review by tonight.", isMe: false, isReaction: nil, dateTime: "3:20 PM"),
    ChatConversationResponse(id: UUID(), text: "Thanks! No rush, just by the end of the week.", isMe: true, isReaction: nil, dateTime: "3:22 PM"),
    ChatConversationResponse(id: UUID(), text: "Will do. And about the trip next month...", isMe: false, isReaction: nil, dateTime: "3:25 PM") ,
    ChatConversationResponse(id: UUID(), text: "Still planning! We should book the flights soon.", isMe: true, isReaction: nil, dateTime: "3:27 PM"),
    ChatConversationResponse(id: UUID(), text: "Agreed. I'll look for deals and let you know.", isMe: false, isReaction: nil, dateTime: "3:29 PM"),
    ChatConversationResponse(id: UUID(), text: "I appreciate it! Talk later?", isMe: true, isReaction: nil, dateTime: "3:30 PM"),
    ChatConversationResponse(id: UUID(), text: "Sure thing. Catch you in the Evening", isMe: false, isReaction: nil, dateTime: "3:32 PM"),
    ChatConversationResponse(id: UUID(), text: "Have a good one!", isMe: true, isReaction: nil, dateTime: "3:34 PM"),
    ChatConversationResponse(id: UUID(), text: "You too! ", isMe: false, isReaction: true, dateTime: "3:35 PM" )
]
