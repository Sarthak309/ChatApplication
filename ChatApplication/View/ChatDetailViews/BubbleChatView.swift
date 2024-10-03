//
//  BubbleChatView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//




import SwiftUI
struct BubbleChatView: View {
    
    
    
    var conversation: ChatConversationResponse
    var body: some View {
        if conversation.isMe{
            HStack{
                Spacer()
                BubbleChat(conversation: conversation, zAlignment: .bottomTrailing, frameAlignment: .trailing, backgroundColor: Color.meChatBackground, offset: (x: -15, y: 20))
            }
        }else{
            HStack{
                BubbleChat(conversation: conversation, zAlignment: .bottomLeading, frameAlignment: .leading, backgroundColor: Color.textFieldBackgroundColor, offset: (x: 15, y: 20))
                Spacer()
            }
        }
    }
}

