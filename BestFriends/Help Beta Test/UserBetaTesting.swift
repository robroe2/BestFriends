//
//  UserBetaTesting.swift
//  BestFriends
//
//  Created by Social Tech on 5/23/22.
//


import Foundation

import SwiftUI

struct UserBetaTesting: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        ZStack {

              Image("settingsBackground")
                  .resizable()
                  .ignoresSafeArea()
                  .scaledToFill()

            VStack {
              
      
                
                Link(destination: URL(string: "https://socialtechlabs.com/beta-tester-_-bestfriends-app/")!) {
                    
                    ZStack {
                        Text("Yes, I want to HELP")
                            .fontWeight(.thin)
                            .frame(width: 310, height: 40)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 30))
                            .background(ColorManager.purple3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                    }
                }
   
                Spacer()
                      .frame(height: 35)
               
                Text("The BestFriends team sincerely \nhopes to make life a little better \nfor teens worldwide with your \nHELP!")
                    .font(.system(size: 23))
                    .fontWeight(.thin)
                    .italic()
                    .foregroundColor(.purple)

                Spacer()
                      .frame(height: 25)
      
                
            VStack {
                Link(destination: URL(string: "https://socialtechlabs.com/reporting-issues-in-bestfriends/")!) {
                    
                Text("Report 'issues' in BestFriends")
                            .fontWeight(.thin)
                            .frame(width: 370, height: 32)
                            .foregroundColor(.white)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 30))
                            .background(ColorManager.grey3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)

//
//                        Button(action: {
//                            sessionManager.showHome()
//                        }, label: {
//                            Text("HOME")
//                                .fontWeight(.thin)
//                                .frame(width: 100, height: 40)
//                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                .font(.system(size: 30))
//                                .background(ColorManager.purple3)
//                                .cornerRadius(15)
//                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                        })

                
                }
            }
        }
    }
    
}
        
    }

    

struct UserBetaTesting_Previews : PreviewProvider {
    static var previews: some View {
        UserBetaTesting()
    }
}


