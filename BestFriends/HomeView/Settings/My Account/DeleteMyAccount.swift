//
//  DeleteMyAccount.swift
//  BestFriends
//
//  Created by Social Tech on 4/9/22.
//


import SwiftUI


struct DeleteMyAccount: View {
    
    @State private var reason: String = ""
    @EnvironmentObject var sessionManager: SessionManager
    
//    private var userManager = UserManager()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.9301232696, green: 0.9072448611, blue: 0.9865264297, alpha: 1))
                .ignoresSafeArea()
//
            ColorManager.grey3
                .ignoresSafeArea()
            

            
            VStack {
                HStack {
//                    Button(action: {
//                        self.presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image("arrowRight")
//                            .resizable()
//                            .frame(width: 25, height: 25)
//                            .scaledToFit()
//                            .colorInvert()
//                            .rotationEffect(Angle(degrees: 180))
//                    }
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Text("Delete My Account")
                    .font(.system(size: 40))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 125)
                
                Text("We're sorry to see you go. If you have a moment please let us know how we can improve.")
                    .font(.system(size: 25))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 20)
                
                TextEditor(text: $reason)
                    .multilineTextAlignment(.center)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .frame(width: 300, height: 300, alignment: .center)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(20)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                                
//                Button(action: {
//                    // Delete account code
//                    userManager.deleteUser(reason: reason)
//                    sessionManager.signOut()
//                }) {
                    Text("Delete Account")
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .frame(width: 220, height: 50)
                        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .cornerRadius(25)
                    
                }
                .padding()
            }
        }
    }

struct DeleteMyAccount_Previews : PreviewProvider {
    static var previews: some View {
        DeleteMyAccount()
    }
}


