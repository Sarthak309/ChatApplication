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
        static let userFirstName = "userFirstName"
        static let userLastName = "userLastName"
        static let userEmail = "userEmail"
        static let mobileNumber = "mobileNumber"
        static let profileImageUrl = "profileImageUrl"
        
    }
    
    // JWT Token
    var jwt: String? {
        get {
            return defaults.string(forKey: Keys.jwt)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.jwt)
        }
    }
    
    // User First Name
    var userFirstName: String? {
        get {
            return defaults.string(forKey: Keys.userFirstName)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.userFirstName)
        }
    }
    
    // User Last Name
    var userLastName: String? {
        get {
            return defaults.string(forKey: Keys.userLastName)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.userLastName)
        }
    }
    
    // User Email
    var userEmail: String? {
        get {
            return defaults.string(forKey: Keys.userEmail)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.userEmail)
        }
    }
    
    // Mobile Number
    var mobileNumber: String? {
        get {
            return defaults.string(forKey: Keys.mobileNumber)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.mobileNumber)
        }
    }
    
    // Profile Image URL
    var profileImageUrl: String? {
        get {
            return defaults.string(forKey: Keys.profileImageUrl)
        }
        set {
            defaults.setValue(newValue, forKey: Keys.profileImageUrl)
        }
    }
    
    // Clear all stored preferences
    func clearUserData() {
        defaults.removeObject(forKey: Keys.jwt)
        defaults.removeObject(forKey: Keys.userFirstName)
        defaults.removeObject(forKey: Keys.userLastName)
        defaults.removeObject(forKey: Keys.userEmail)
        defaults.removeObject(forKey: Keys.mobileNumber)
        defaults.removeObject(forKey: Keys.profileImageUrl)
    }
    
}
