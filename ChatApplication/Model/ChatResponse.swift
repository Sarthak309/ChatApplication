//
//  ChatResponse.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//

import Foundation

struct ChatResponse: Hashable, Identifiable {
    
    var id: UUID
    var user: UserResponse
    var text: String?
    var badgeNumber: Int?
    var type: Int // assuming 1 text, 2 missed voice call, 3 voice record
    var timeAgo: String
}
