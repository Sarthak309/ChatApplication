//
//  UserResponse.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//

import Foundation

struct UserResponse: Identifiable, Hashable{
    var id: UUID
    var name: String
    var profileUrl: String
}
