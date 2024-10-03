//
//  LoginViewModel 2.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var mobileNumber = ""
    @Published var isLoading = false
    @Published var alertMessage: String?
    @Published var showErrorAlert = false
    @Published var isLoggedInSuccessfully = false
    
    private let userPreferences = UserPreferences()
    
    func login() {
        guard !mobileNumber.isEmpty else{
            self.alertMessage = "Please fill in all the Fieds"
            self.showErrorAlert = true
            self.isLoggedInSuccessfully = false
            return
        }
        guard mobileNumber.count == 10 else{
            self.alertMessage = "The number should be of 10 digits"
            self.showErrorAlert = true
            self.isLoggedInSuccessfully = false
            return
        }
        
        isLoading = true
        let userRequest = UserRequest(dialCode: "+91",
                                      mobileNumber: Int(mobileNumber) ?? 8077524294,
                                      orderId: "Otp_C03193D6350149669EF37D5FB1B3F7E0",
                                      otp: 234768)
        
        mobileNumber = ""
        
        APIService.shared.login(userRequest) { result in
            switch result {
            case .success(let userData):
                
                self.userPreferences.jwt = userData.authToken
                self.userPreferences.userFirstName = userData.firstName
                self.userPreferences.userLastName = userData.lastName
                self.userPreferences.userEmail = userData.email
                self.userPreferences.mobileNumber = "\(userData.mobileNumber)"
                self.userPreferences.profileImageUrl = userData.profileImage?.url
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    self.isLoggedInSuccessfully = true
                    self.isLoading = false
                    self.alertMessage = nil
                }
            case .failure(let failure):
                DispatchQueue.main.async{
                    self.alertMessage = failure.desc
                    self.isLoading = false
                    self.showErrorAlert = true
                    self.isLoggedInSuccessfully = false
                }
            }
        }
        
    }
}
