//
//  SettingHeaderView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import SwiftUI
struct SettingHeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 12){
            Text("Today")
                .font(.footnote)
                .padding(.vertical,2)
                .padding(.horizontal)
                .background(colorScheme == .light ? Color.todayChatBackground : Color.todayChatBackgroundDark)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(alignment: .top, spacing: 10){
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 8, height: 8)
                    .padding(.top, 6)
                    .foregroundStyle(.black)
                Text("Messages are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Click to learn more")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
            }
            .padding(.vertical, 4)
            .padding(.horizontal)
            .background(Color.settingChatBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 30)
            
        }
    }
}
