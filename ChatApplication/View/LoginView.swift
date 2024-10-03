//
//  LoginView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var isFocusedOnMobileNumber: Bool
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                TextField("Mobile number", text: $viewModel.mobileNumber)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .keyboardType(.phonePad)
                    .focused($isFocusedOnMobileNumber)
                
                if viewModel.isLoading{
                    ProgressView()
                }else {
                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Login")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                }
                if let alertMessage = viewModel.alertMessage{
                    Text(alertMessage)
                        .foregroundStyle(viewModel.showErrorAlert ? .red : .green)
                        .padding(.top,10)
                }

            }
            .navigationDestination(isPresented: $viewModel.isLoggedInSuccessfully, destination: {
                ChatView()
            })
            .padding()
            .navigationTitle("Login")
            .navigationBarBackButtonHidden()
            .toolbar {
                if isFocusedOnMobileNumber{
                    Button{
                        isFocusedOnMobileNumber = false
                    }label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}
#Preview {
    LoginView()
}


