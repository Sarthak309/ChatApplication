//
//  LoginView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
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
        }
    }
}
#Preview {
    LoginView()
}


