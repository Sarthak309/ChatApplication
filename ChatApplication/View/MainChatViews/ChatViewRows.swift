//
//  ChatViewRows.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import SwiftUI

struct ChatViewRows: View{
    let chatResponse: GroupData
    var body: some View{
        HStack(spacing: 5){
            ProfileImageView(profileURL: chatResponse.group.file?.localFilePath ?? "", size: 70)
                .overlay(Circle().stroke(.gray.opacity(0.15)))
            
            VStack(alignment: .leading, spacing: 0){
                Text(chatResponse.group.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 6) {
                    IconTypeView(type: chatResponse.group.latestMessage?.mappedType ?? .none)
                    Text(chatResponse.group.latestMessage?.content ?? "")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.primary.opacity(0.6))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.leading, 10)
            
            VStack(alignment: .trailing, spacing: -3){
                if chatResponse.unreadCount != 0{
                    Text(chatResponse.group.latestMessage?.formattedDate ?? "")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.primaryColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }else{
                    Text(chatResponse.group.latestMessage?.formattedDate ?? "")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.primary.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                if chatResponse.unreadCount > 0{
                    ZStack{
                        Circle()
                            .fill(Color.primaryColor)
                            .frame(width: chatResponse.unreadCount > 99 ? 27 : 22, height: chatResponse.unreadCount > 99 ? 27 : 22)
                        Text(chatResponse.unreadCount > 99 ? "\(99)+" : "\(chatResponse.unreadCount)")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.top, 8)
                }
            }
            .frame(width: 80)
        }
    }
    
}

