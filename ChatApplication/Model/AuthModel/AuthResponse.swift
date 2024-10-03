//
//  AuthResponse.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//

import Foundation

// MARK: - AuthResponse
struct AuthResponse: Codable {
    let status: Bool
    let code: Int
    let message: String
    let resources: Resources?
}

// MARK: - Resources
struct Resources: Codable {
    let data: UserData
}

// MARK: - UserData
struct UserData: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let dialCode: String
    let mobileNumber: Int
    let profileImage: ProfileImage?
    let authToken: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName, email, dialCode, mobileNumber, profileImage, authToken
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let avatarId: String
    let url: String
}

