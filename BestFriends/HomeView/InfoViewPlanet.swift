//
//  InfoViewPlanet.swift
//  BestFriends
//
//  Created by Social Tech on 7/6/22.
//

import Foundation

import SwiftUI


struct InfoViewPlanet: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: User
    
    
    var body: some View {
        ZStack {
            
//            Image("purpleBackground")
//                .resizable()
//                .ignoresSafeArea()
//                .scaledToFill()
//
//            AdPlayerView(name: "FieldFlowers")
//                .ignoresSafeArea()
            
            ColorManager.grey4
                .ignoresSafeArea()
                .onAppear()
            
            VStack {
//                Text("Getting STARTED")
////                    .foregroundColor(.gray)
//                    .foregroundColor(ColorManager.grey2)
//                    .font(.system(size: 25, weight: .bold))
//
//                Spacer()
//                .frame(height: 5)
             
                
                Spacer()
                .frame(height: 15)
                NavigationLink(
                    destination: InviteView(user: user),
                    label: {
                        Text("Add Friends")
                            .fontWeight(.thin)
                            .frame(width: 250, height: 40)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 25))
                            .background(ColorManager.pmbc_green)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                  
                    })
                
           
//
//                Text("Tap Center Planet on Homepage")
//                    .font(.system(size: 20))
//                    .fontWeight(.thin)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.purple)
//
//                Text("-Planet menu page show up")
//                    .font(.system(size: 15))
//                    .fontWeight(.light)
//                    .multilineTextAlignment(.center)
////                    .foregroundColor(Color.white)
//                    .foregroundColor(ColorManager.grey1)
                
//                Spacer()
//                .frame(height: 15)
//
                
            VStack {
                
            
             
//                Text("Add Friends")
//                    .font(.system(size: 20))
//                    .fontWeight(.thin)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.purple)
                
                Text("-Add up to five friends \n(10 with Premium) \n-Their 'Planets' will appear on Homepage")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.white)
                    .foregroundColor(ColorManager.grey1)
                
                
            
                
                Spacer()
                     .frame(height: 15)
                
                Text("Friend sent \n'Push Notification'")
                    .font(.system(size: 25))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.blue)
                
                Text("-Tap friend's planet that sent")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .foregroundColor(ColorManager.grey1)
//                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                 
                Text("notification, see dropdown")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .foregroundColor(ColorManager.grey1)
//                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
             
                Text("- tap planets to 'show/hide' notifications")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .foregroundColor(ColorManager.grey1)
//                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
             
                VStack {
                    Spacer()
                    .frame(height: 15)

                    Text("Create NEW Chat Rooms")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                        .multilineTextAlignment(.center)
                        
                       .foregroundColor(Color.purple)
                    
                Text("-Tap Friend's Planet \n-Tap [Create NEW Chat Rooms] \n-Name Chat Room \n-We send Push Notification to Friend")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorManager.grey1)
//                    .foregroundColor(.gray)

             
                }
                
            VStack {
                
                Spacer()
                .frame(height: 15)
                
          
           Text("Inside Chat Rooms")
               .font(.system(size: 20))
               .fontWeight(.thin)
               .multilineTextAlignment(.center)
               .foregroundColor(Color.purple)
           
           Text("-Use 'Pullup' to see Chat Rooms")
               .font(.system(size: 15))
               .fontWeight(.light)
               .multilineTextAlignment(.center)
               .foregroundColor(ColorManager.grey1)
                Text("-Tap [Remove Me] to be removed")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorManager.grey1)
                Text("-Tap 'HOME' icon to Exit")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorManager.grey1)

                
                
                

                    
                Spacer()
                     .frame(height: 15)
                     
//
//                Text("Hide Chat")
//                    .font(.system(size: 20))
//                    .fontWeight(.thin)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.purple)
//
                Text("-Tap 'Lock' icon to Hide Chat")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorManager.grey1)

                Text("-to 'Un-Hide' enter 4 digit PIN")
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorManager.grey1)
                    Spacer()
                    .frame(height: 0)
                }
                
            VStack {
 
//                
             
              
                Spacer()
                .frame(height: 15)
                
                NavigationLink(
                    destination: Subscriptions(),
                    label: {
                        Text("Get PREMIUM")
                            .fontWeight(.thin)
                            .frame(width: 200, height: 40)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 25))
                            .background(ColorManager.purple3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                  
                    })
                
//
//                Spacer()
//                .frame(height: 15)
//
//                NavigationLink(
//                    destination: BuiltByTeens2(),
//                    label: {
//                        Text("Team / Demo / Prototypes")
//                            .fontWeight(.thin)
//                            .frame(width: 300, height: 40)
//                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                            .font(.system(size: 25))
//                            .background(ColorManager.purple3)
//                            .cornerRadius(15)
//                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//                    })
              

                
                Spacer()
                .frame(height: 75)
                

           
               
            }
        }
        
    }
}
}



}