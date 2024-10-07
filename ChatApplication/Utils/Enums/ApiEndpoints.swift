//
//  ApiEndpoints.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//

import Foundation

enum ApiEndpoints{
    
    case login
    case groupList
    
    var url: String{
        switch self{
        case .login:
            return "/api/v1/user/auth"
        case .groupList:
            return "/api/v2/group/list/paginated"
        @unknown default:
            return "no URl"
        }
    }
}
