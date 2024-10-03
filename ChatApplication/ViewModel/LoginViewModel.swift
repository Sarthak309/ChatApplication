//
//  LoginViewModel 2.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var alertMessage: String?
    @Published var showErrorAlert = false
    @Published var isLoggedInSuccessfully = false
    
    private let userPreferences = UserPreferences()
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else{
            self.alertMessage = "Please fill in all the Fieds"
            self.showErrorAlert = true
            self.isLoggedInSuccessfully = false
            return
        }
        
        isLoading = true
        let _ : [String: String] = [
            "email": email,
            "password": password
        ]
        
        email = ""
        password = ""
        
        DispatchQueue.main.async{
            self.isLoggedInSuccessfully = true
            self.isLoading = false
            self.alertMessage = nil
        }
//        APIService.shared.login(parameters: parameters) { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result{
//                case .success(let response):
//                    self?.showErrorAlert = false
//                    self?.alertMessage = "Logged in Successfully"
//                    self?.userPreferences.jwt = response.jwt
//                    self?.userPreferences.userId = response.userId
//                    self?.userPreferences.userRole = response.decodedUserRole()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                        self?.isLoggedInSuccessfully = true
//                        self?.alertMessage = nil
//                    }
//                case .failure(let error):
//                    print(error)
//                    if let errorCode = error.responseCode{
//                        if errorCode == 403{
//                            self?.showErrorAlert = true
//                            self?.alertMessage = "Invalid credentials"
//                            self?.isLoggedInSuccessfully = false
//                            return
//                        }
//                    }
//                    print(error.localizedDescription)
//                    self?.showErrorAlert = true
//                    self?.alertMessage = error.localizedDescription
//                }
//            }
//        }
    }
    
    
}
