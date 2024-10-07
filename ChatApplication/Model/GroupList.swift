//
//  GroupList.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//


import Foundation

// MARK: - GroupList
struct GroupList: Codable {
    let status: Bool
    let code: Int
    let message: String
    let resources: GroupResources?
}

// MARK: - Resources
struct GroupResources: Codable {
    let data: [GroupData]
    let currentPage: Int
    let currentTotal: Int
    let totalCount: Int
}

// MARK: - GroupData
struct GroupData: Codable {
    let group: Group
    let unreadCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case group
        case unreadCount
    }
}

// MARK: - Group
struct Group: Codable {
    let id: String
    let name: String
    let description: String
    let file: File?
    let latestMessage: LatestMessage?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, file, latestMessage
    }
}

// MARK: - LatestMessage
struct LatestMessage: Codable {
    let id: String
    let content: String
    let type: String
    let createdAt: String
    
    var mappedType: MessageType {
        switch type{
        case "text":
            return .text
        case "image":
            return .image
        case "audio":
            return .audio
        case "video":
            return .video
        default:
            return .none
        }
    }
    
    var formattedDate: String {
        // Date Formatter to parse the ISO8601 date string
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        // Get the Date object from the createdAt string
        guard let date = isoDateFormatter.date(from: createdAt) else { return createdAt }
        
        // Date Formatter to output the result in dd/MM/yy format
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yy"
        
        // Get the current date
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return outputFormatter.string(from: date)
        }
    }

    //["text", "image", "audio", "video"];
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content, type, createdAt
    }
}


