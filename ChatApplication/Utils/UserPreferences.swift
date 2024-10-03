//
//  UserPreferences.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//


import Foundation

class UserPreferences {
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let jwt = "jwt"
        static let userId = "userId"
        static let userRole = "userRole"
    }
    
    var jwt: String? {
        get {
            return defaults.string(forKey: Keys.jwt)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.jwt)
        }
    }
    
    var userId: Int? {
        get {
            return defaults.integer(forKey: Keys.userId) == 0 ? nil : defaults.integer(forKey: Keys.userId)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.userId)
        }
    }
    
//    var userRole: UserRole? {
//        get {
//            guard let rawValue = defaults.string(forKey: Keys.userRole) else { return nil }
//            return UserRole(rawValue: rawValue)
//        }
//        set {
//            defaults.setValue(newValue?.rawValue, forKey: Keys.userRole)
//        }
//    }
}
