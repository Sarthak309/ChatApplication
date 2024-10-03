//
//  ChatConversationResponse.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import Foundation
struct ChatConversationResponse: Hashable, Identifiable {
    var id: UUID
    var text: String
    var isMe: Bool
    var isReaction: Bool? // assuming true is reaction emoji, false is nil
    var dateTime: String
}
