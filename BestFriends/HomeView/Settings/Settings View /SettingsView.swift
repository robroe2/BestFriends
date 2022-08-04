//
//  SettingsView.swift
//  BestFriends
//
//  Created by Social Tech on 4/8/22.
//



import Foundation

import SwiftUI

struct SettingsView: View {
    
    let user: User
    
    @EnvironmentObject var sessionManager: SessionManager
    @State private var loadingShowing = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9301232696, green: 0.9072448611, blue: 0.9865264297, alpha: 1))
                .ignoresSafeArea()
            
//            Image("settingsBackground")
//                .resizable()
//                .ignoresSafeArea()
//                .scaledToFill()
//
            ColorManager.grey4
                .ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("arrowRight")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                            .scaledToFit()
//                            .colorInvert()
                            .rotationEffect(Angle(degrees: 180))
                    }
//                    .padding(.trailing, 50)
                    
                    Text("back")
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .regular))
                        .padding(.trailing, 50)
                    
                        .padding(.trailing, 30)
                        
                    
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.trailing, 50)
                    
                    
                }
                
                Spacer()
                    .frame(height: 20)
                
                NavigationLink(
                    destination: MyAccountView(user: user),
                    label: {
                        HStack {
                            Text("Manage My Account")
                                .font(.system(size: 20))
                                .foregroundColor(.purple)
                            
                            Spacer()
                            
                            Image("arrowRight")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .scaledToFit()
//                                .colorInvert()
                        }
                        .padding(.horizontal, 15)
                    })
                
                .navigationBarHidden(true)
                
//                MARK: Set up [Customize my Planet here
                
//                Divider()
                
//                NavigationLink(
//                    destination: EmptyView(),
//                    label: {
//                        HStack {
//                            Text("Set-up PhotoPoP")
//                                .font(.system(size: 20))
//                                .foregroundColor(.purple)
//
//
//                            Spacer()
//
//                            Image("arrowRight")
//                                .resizable()
//                                .frame(width: 25, height: 25)
//                                .scaledToFit()
////                                .colorInvert()
//                        }
//                        .padding(.horizontal, 15)
//                    })
//
//
//                .navigationBarHidden(true)
//
                
                
                Divider()
                
                NavigationLink(
                    destination: ReportAbuseView(),
                    label: {
                        HStack {
                            Text("Report Abusive Behavior")
                                .font(.system(size: 20))
                                .foregroundColor(.purple)
                            
                            Spacer()
                            
                            Image("arrowRight")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .scaledToFit()
//                                .colorInvert()
                        }
                        .padding(.horizontal, 15)
                    })
                
                
                .navigationBarHidden(true)
                
                Divider()
                
                NavigationLink(
                    destination: TermsConditionsView(),
                    label: {
                        HStack {
                            Text("Terms of Service & Privacy Policy")
                                .font(.system(size: 20))
                                .foregroundColor(.purple)
                            
                            Spacer()
                            
                            Image("arrowRight")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .scaledToFit()
//                                .colorInvert()
                        }
                        .padding(.horizontal, 15)
                        .navigationBarHidden(true)     })
                
                VStack {
                    
                    Divider()
                    
                    NavigationLink(
                        destination: ReportIssues(),
                        label: {
                            HStack {
                                Text("Report Technical Issues")
                                    .font(.system(size: 20))
                                    .foregroundColor(.purple)
                                
                                Spacer()
                                
                                Image("arrowRight")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .scaledToFit()
//                                    .colorInvert()
                            }
                            .padding(.horizontal, 15)
                            .navigationBarHidden(true)     })
                    
//                            HStack {
//                                Text("Report issues with BestFriends")
//                                    .font(.system(size: 20))
//                                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
////                                    .foregroundColor(ColorManager.red)
//
//                                Spacer()
//
//                                Image("arrowRight")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//                                    .scaledToFit()
//                                    .colorInvert()
//                            }
//                            .padding(.horizontal, 15)
//                            .onTapGesture {
//                                RestApi.instance.signOut()
//                                sessionManager.showLogin()
//                            }
//
                    Divider()
                    
                    
                            HStack {
                                Text("Sign Out (tap arrow)")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image("arrowRight")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .scaledToFit()
//                                    .colorInvert()
                            }
                            .padding(.horizontal, 15)
                            .onTapGesture {
                                RestApi.instance.signOut()
                                sessionManager.showLogin()
                            }
                    
                    
                    Divider()
                 
                    Spacer()
                        .frame(height: 50)
                    
                    
                    
                    VStack {
                        

//                        Spacer()
//                        .frame(height: 20)
//
//                        NavigationLink(
//                            destination: Subscriptions(),
//                            label: {
//                                Text("Get PURPLE")
//                                    .fontWeight(.thin)
//                                    .frame(width: 150, height: 40)
//                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                    .font(.system(size: 25))
//                                    .background(ColorManager.purple3)
//                                    .cornerRadius(15)
//                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//                            })
                        
                        
                        Spacer()
                        .frame(height: 20)
                        
                        NavigationLink(
                            destination: BuiltByTeens2(),
                            label: {
                                Text("BestFriends Team")
                                    .fontWeight(.thin)
                                    .frame(width: 200, height: 40)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .font(.system(size: 25))
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                          
                            })
                      
                        Spacer()
                        .frame(height: 20)
                        
                        NavigationLink(
                            destination: BetaTestVideo(),
                            label: {
                                Text("Help Test Prototypes")
                                    .fontWeight(.thin)
                                    .frame(width: 260, height: 40)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .font(.system(size: 25))
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                          
                            })
                        
                        Spacer()
                        .frame(height: 20)
                        
                          Button(action: {
                              sessionManager.showLogin()
                          },
                              label: {
                                  Text("Home / Chat")
                                      .fontWeight(.thin)
                                      .frame(width: 200, height: 40)
                                      .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                      .font(.system(size: 30))
                                      .background(ColorManager.purple3)
                                      .cornerRadius(15)
                                      .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                              })
                          

                        Spacer()
                            .frame(height: 150)
     
            }
        }
    }
}

}

}






//struct SettingsView_Previews : PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}





