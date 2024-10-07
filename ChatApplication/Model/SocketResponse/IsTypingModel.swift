//
//  IsTypingModel.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//

import Foundation

struct IsTypingModel: Codable{
    var isTyping: Bool
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case isTyping = "is_typing"
        case user
    }
}


