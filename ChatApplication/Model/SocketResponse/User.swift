//
//  User.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//


struct User: Codable{
    var id: String
    var firstName: String
    var lastName: String
    
    enum CodingKeys:String, CodingKey {
        case id = "_id"
        case firstName,lastName
    }
}