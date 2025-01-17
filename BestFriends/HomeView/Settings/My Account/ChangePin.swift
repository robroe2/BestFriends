//
//  ChangePin.swift
//  BestFriends
//
//  Created by Social Tech on 4/9/22.
//

import Foundation

import SwiftUI


struct ChangePin: View {
    
    let user: User
    
    @State private var oldPin: String = ""
    @State private var newPin: String = ""
    @State private var statusString = ""
    @State private var statusColor = Color(.clear)
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    //    var userDataSource = UserDataSource()
    
    var body: some View {
        //        NavigationView {
        ZStack {
            
            
            ColorManager.grey4
                .ignoresSafeArea()
            
            
            VStack {
                
                Text("Change Pin")
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                
                Text(statusString)
                    .font(.system(size: 30))
                    .foregroundColor(statusColor)
                    .multilineTextAlignment(.center)
                    .padding()
                
                TextField("Old pin", text: $oldPin)
                    .multilineTextAlignment(.center)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .frame(width: 300, height: 40, alignment: .center)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(20)
                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Spacer()
                    .frame(height: 30)
                
                
                TextField("New pin", text: $newPin)
                    .multilineTextAlignment(.center)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .frame(width: 300, height: 40, alignment: .center)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(20)
                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Spacer()
                    .frame(height: 75)
                //
                Button("Submit", action: changePin)
                    .font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .frame(width: 200, height: 50)
                    .background(ColorManager.purple3)

                    .cornerRadius(25)
                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2).onTapGesture {
                        changePin()
                    }
                
            }
        }
    }
    
    
    //
    private func changePin() {
        if oldPin.count != 4 || newPin.count != 4 {
            statusString = "Both pins must be 4 digits"
            statusColor = Color.red
            return
        }
        if user.chatPin == oldPin {
            RestApi.instance.updateUser(user: User(id: user.id, firstName: user.firstName, lastName: user.lastName, APNToken: user.APNToken, friends: user.friends, groups: user.groups, hiddenGroups: user.hiddenGroups, atmosphere: user.atmosphere, chatPin: newPin, chatBackground: user.chatBackground, smileNotes: user.smileNotes)).then({ response in
                if response == 200 {
                    statusString = "Success"
                    statusColor = Color.green
                } else {
                    statusString = "Wrong pin"
                    statusColor = Color.red
                }
            })
        } else {
            statusString = "Wrong pin"
            statusColor = Color.red
        }
    }
}

//
//struct ChangePin_Previews : PreviewProvider {
//    static var previews: some View {
//        ChangePin()
//    }
//}
