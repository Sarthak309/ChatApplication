//
//  Message.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//


import Foundation

// MARK: - Message
struct Message: Codable {
    let id: String
    let group: String
    let content: String
    let file: File?
    let repliedTo: RepliedToMessage?
    let type: String
    let category: String
    let event: Event?
    let sender: Sender

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case group, content, file, repliedTo, type, category, event, sender
    }
}

// MARK: - File
struct File: Codable {
    let originalName: String?
    let localFilePath: String
    let mimeType: String
}

// MARK: - RepliedToMessage
struct RepliedToMessage: Codable {
    let id: String
    let sender: Sender
    let file: File?
    let content: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case sender, file, content, type
    }
}

// MARK: - Sender
struct Sender: Codable {
    let id: String
    let firstName: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName
    }
}

// MARK: - Event
struct Event: Codable {
    let id: String
    let name: String
    let theme: String
    let venue: String
    let startTime: String
    let endTime: String
    let graceTime: String
    let file: File

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, theme, venue, startTime, endTime, graceTime, file
    }
}
