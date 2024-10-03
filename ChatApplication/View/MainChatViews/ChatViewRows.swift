//
//  ChatViewRows.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import SwiftUI

struct ChatViewRows: View{
    let chatResponse: ChatResponse
    var body: some View{
        HStack(spacing: 5){
            ProfileImageView(profileURL: chatResponse.user.profileUrl, size: 70)
                .overlay(Circle().stroke(.gray.opacity(0.15)))
            
            VStack(alignment: .leading, spacing: 0){
                Text(chatResponse.user.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 6) {
                    IconTypeView(type: chatResponse.type)
                    Text(chatResponse.text ?? "")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.primary.opacity(0.6))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.leading, 10)
            
            VStack(alignment: .trailing, spacing: -3){
                if chatResponse.badgeNumber != nil{
                    Text(chatResponse.timeAgo)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.primaryColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }else{
                    Text(chatResponse.timeAgo)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.primary.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                if let badgeNumber = chatResponse.badgeNumber, badgeNumber > 0{
                    ZStack{
                        Circle()
                            .fill(Color.primaryColor)
                            .frame(width: 22, height: 22)
                        Text("\(badgeNumber)")
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

