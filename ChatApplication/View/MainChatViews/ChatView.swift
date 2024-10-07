//
//  ChatView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 01/10/24.
//


import SwiftUI
import Logger
import Foundation

struct ChatView: View {
    
    @EnvironmentObject private var socketManager: SocketIOManager
    @ObservedObject private var viewModel = ChatViewModel()
    @State private var groupList = [GroupData]()
    
    var body: some View {
        if socketManager.isConnected{
            NavigationStack{
                ScrollView{
                    VStack{
                        VStack(spacing: 20){
                            HStack{
                                Text("Brodcase List")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.primaryColor)
                                Spacer()
                                Text("New Group")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.primaryColor)
                            }
                            .padding(.horizontal)
                            
                            Divider()
                            
                            LazyVStack{
                                ForEach(self.groupList, id: \.group.id){ item in
                                    
//                                    NavigationLink(destination: ChatDetailView(chatResponse: item)){
                                        VStack(spacing: 5) {
                                            ChatViewRows(chatResponse: item)
                                                .padding(.horizontal)
                                            Divider()
                                                .padding(.leading, 100)
                                        }
//                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden()
                .navigationTitle("Chats: \(socketManager.unreadCount)")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            
                        }label: {
                            Text("Edit")
                                .fontWeight(.semibold)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 20) {
                            Button{
                                
                            }label: {
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            Button{
                                
                            }label: {
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 20)
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.socketManager = self.socketManager
                viewModel.fetchGroupList{
                    self.groupList = viewModel.groupList
                }
            }
            .onReceive(viewModel.$groupList) { groupList in
                self.groupList = groupList
            }
        }else{
            ProgressView("Waiting for connection")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview{
    ChatView()
}

