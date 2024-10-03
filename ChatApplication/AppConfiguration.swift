//
//  AppConfiguration.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//

import Foundation

class AppConfiguration{
    
    lazy var apiBaseUrl: String = {
        if let baseURL = Bundle.main.infoDictionary?["Api_base_url"] as? String {
            return baseURL
        } else {
            return "https://default-url.com" // Default URL in case the key is not found
        }
    }()
}
