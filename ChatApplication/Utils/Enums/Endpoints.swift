//
//  Endpoints.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//

import Foundation

enum Endpoints{
    
    case login
    
    
    var url: String{
        switch self{
        case .login:
            return "/api/v1/user/auth"
        @unknown default:
            return "no URl"
        }
    }
}
