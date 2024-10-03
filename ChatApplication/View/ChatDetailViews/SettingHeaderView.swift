//
//  SettingHeaderView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import SwiftUI
struct SettingHeaderView: View {
    var body: some View {
        VStack(spacing: 12){
            Text("Today")
                .font(.footnote)
                .padding(.vertical,2)
                .padding(.horizontal)
                .background(Color.todayChatBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(alignment: .top, spacing: 10){
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 8, height: 8)
                    .padding(.top, 6)
                Text("Messages are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Click to learn more")
                    .font(.footnote)
                    .fontWeight(.regular)
            }
            .padding(.vertical, 4)
            .padding(.horizontal)
            .background(Color.settingChatBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 30)
            
        }
    }
}
