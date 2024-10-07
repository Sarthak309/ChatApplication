//
//  IconTypeView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//

import SwiftUI

struct IconTypeView:View {
    var type: MessageType
    var body: some View {
        switch type{
        case .text:
            Image(systemName: type.imageName)
                .resizable()
                .scaledToFill()
                .foregroundStyle(.gray)
                .frame(width: 12, height: 12)
                .padding(.top, 3)
        case .audio:
            Image(systemName: type.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 13, height: 13)
                .foregroundStyle(Color.dangerColor)
                .padding(.top, 3)
        case .image:
            Image(systemName: type.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.chatColor)
                .padding(.top, 3)
        case .video:
            Image(systemName: type.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.chatColor)
                .padding(.top, 3)
        default:
            Image(systemName: type.imageName)
                .resizable()
                .scaledToFill()
                .foregroundStyle(.gray)
                .frame(width: 12, height: 12)
                .padding(.top, 3)
        }
    }
}
