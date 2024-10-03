//
//  FooterFloatingView.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//



import SwiftUI
struct FooterFloatingView: View {
    
    @State private var sendMessage:String = ""
    @State private var value: CGFloat = 0
    
    var body: some View {
        VStack{
            HStack (spacing: 20) {
                Button{
                    
                }label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryColor)
                }
                
                HStack(spacing: 0) {
                    TextField("", text: $sendMessage)
                        .padding(.all,10)
                        .foregroundStyle(.black)
                    Spacer()
                    HStackLayout(spacing: 20){
                        Button{
                            
                        }label: {
                            Image(systemName: "paperplane")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.primaryColor)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.gray.opacity(0.3))
                }
                
                
                Button{
                    
                }label: {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryColor)
                }
                Button{
                    
                }label: {
                    Image(systemName: "mic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color.primaryColor)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 85)
        .background(.white)
        .offset(y: -self.value)
        .animation(.easeInOut(duration: 0.1), value: self.value)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { noti in
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.value = height
                
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { _  in
                self.value = 0
            }
        }
    }
}
