//
//  ProfileImageView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    let profileURL: String
    let size: CGFloat
    
    var body: some View {
        KFImage(URL(string: profileURL))
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: size, height: size)
            
    }
}

#Preview {
    ProfileImageView(profileURL: currentUserData.profileUrl, size: 390)
}
