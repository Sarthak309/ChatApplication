//
//  BubbleChat.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//


import SwiftUI
struct BubbleChat:View {
    var conversation: ChatConversationResponse
    var zAlignment: Alignment
    var frameAlignment: Alignment
    var backgroundColor: Color
    var offset: (x: CGFloat, y: CGFloat)
    
    var body: some View {
        ZStack(alignment: zAlignment){
            VStack(alignment: .leading) {
                Text(conversation.text)
                    .font(.subheadline)
                    .foregroundStyle(Color.primary)
            }
            .padding(.vertical, 7)
            .padding(.horizontal,12)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 0.1)
            }
            .shadow(color: Color.primary.opacity(0.08), radius: 0, x: 0, y: 1)
            .frame(maxWidth: .infinity, alignment: frameAlignment)
            
            if conversation.isReaction != nil{
                Text("😁")
                    .font(.footnote)
                    .padding(.all,4)
                    .background(.white)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.gray.opacity(0.1))
                    }
                    .offset(x: offset.x, y: offset.y)
            }
        }
    }
}
