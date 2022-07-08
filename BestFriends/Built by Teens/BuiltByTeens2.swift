//
//  BuiltByTeens2.swift
//  BestFriends
//
//  Created by Social Tech on 6/17/22.
//

import Foundation
import SwiftUI
//import AVKit


struct BuiltByTeens2: View {
    
    var body: some View {
        
        ZStack {
            
//            ColorManager.grey4
//                  .ignoresSafeArea()
//
//
            Image("BestFriends")
//                .frame(width: 100, height: 40)
               .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
         

            VStack {
                
                
                Text("Building Resilient")
                    .font(.system(size: 30))
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.gray)
                
                Text("Friendships")
                    .font(.system(size: 40))
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.gray)
                
                
                Spacer()
                    .frame(height: 5)
                
                Link(destination: URL(string: "https://socialtechlabs.com")!) {
                        Text("Built by Teens")
                            .fontWeight(.thin)
                            .frame(width: 330, height: 40)
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .background(ColorManager.purple3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                            .opacity(0.4)
                 
                }
                Text("(the 'Zen Masters' of social media)")
               
                    .font(.system(size: 20))
                    .italic()
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.black)
                
                Spacer()
                    .frame(height: 320)
                
               
                Link(destination: URL(string: "https://socialtechlabs.com/about-bestfriends/")!) {
                        Text("BestFriend's Features Explained")
                            .fontWeight(.thin)
                            .frame(width: 330, height: 40)
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .background(ColorManager.purple3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                           .opacity(0.4)
                    
                }
                Spacer()
                    .frame(height: 20
                    )
                
                NavigationLink(
                    destination: BetaTestVideo(),
                    label: {
                        Text("Test 'Future Prototypes'")
                            .fontWeight(.thin)
                            .frame(width: 330, height: 40)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 30))
                            .background(ColorManager.purple3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                            .opacity(0.4)

                        
                        
                    })
                
                
                Spacer()
                    .frame(height: 90)
                
         
            
              
                        

            }//VStack
        }//ZStack
    }//body
}//struct

    

