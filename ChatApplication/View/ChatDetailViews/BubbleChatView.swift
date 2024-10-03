//
//  BubbleChatView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//




import SwiftUI
struct BubbleChatView: View {
    @Environment(\.colorScheme) var colorScheme
    var conversation: ChatConversationResponse
    var body: some View {
        if conversation.isMe{
            HStack{
                Spacer()
                BubbleChat(conversation: conversation,
                           zAlignment: .bottomTrailing,
                           frameAlignment: .trailing,
                           backgroundColor: colorScheme == .light ? Color.meChatBackground : Color.meChatBackgroundDark,
                           offset: (x: -15, y: 20))
            }
        }else{
            HStack{
                BubbleChat(conversation: conversation,
                           zAlignment: .bottomLeading,
                           frameAlignment: .leading,
                           backgroundColor: colorScheme == .light ? Color.textFieldBackgroundColor : Color.textFieldBackgroundColorDark,
                           offset: (x: 15, y: 20))
                Spacer()
            }
        }
    }
}

