//
//  ChatViewModel.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 04/10/24.
//

import Foundation

class ChatViewModel:ObservableObject{
    @Published var groupList: [GroupData] = []
    var socketManager: SocketIOManager?
    
    func fetchGroupList(completion: @escaping () -> Void){
        APIService.shared.fetchGroupList { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.groupList = success
                    print(success.first?.group.latestMessage?.mappedType ?? .none)
                    print(success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        completion()
                    }
                }
                
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.groupList = []
                }
                print(failure.desc)
            }
        }
    }
    
}
