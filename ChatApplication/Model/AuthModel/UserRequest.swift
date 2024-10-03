//
//  UserRequest.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//

import Foundation

struct UserRequest:Codable{
    let dialCode: String
    let mobileNumber: Int
    let orderId: String
    let otp: Int
}
