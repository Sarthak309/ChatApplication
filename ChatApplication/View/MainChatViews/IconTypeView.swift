//
//  IconTypeView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//

import SwiftUI

struct IconTypeView:View {
    var type: Int
    var body: some View {
        switch type{
        case 1:
            Image(systemName: "checkmark")
                .resizable()
                .scaledToFill()
                .foregroundStyle(.gray)
                .frame(width: 12, height: 12)
                .padding(.top, 3)
        case 2:
            Image(systemName: "phone.arrow.down.left.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 13, height: 13)
                .foregroundStyle(Color.dangerColor)
                .padding(.top, 3)
        case 3:
            Image(systemName: "mic.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.chatColor)
                .padding(.top, 3)
        default:
            Text("")
        }
    }
}
