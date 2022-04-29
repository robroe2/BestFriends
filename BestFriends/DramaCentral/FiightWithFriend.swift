//
//  FiightWithFriend.swift
//  BestFriends
//
//  Created by Social Tech on 4/28/22.
//


import Foundation
import SwiftUI

struct FightWithFriend: View {
    
    var body: some View {
       NavigationView {
            
            ZStack {
                Color(#colorLiteral(red: 0.9301232696, green: 0.9072448611, blue: 0.9865264297, alpha: 1))
                    .ignoresSafeArea()
//                Image("purpleBackground")
//                    .resizable()
//                    .ignoresSafeArea()
//                    .scaledToFill()
//
                Image("purpleBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
//
//
//                AdPlayerView(name: "backgroundAnimation")
//                    .ignoresSafeArea()
//                    .blendMode(.screen)
//                    .offset(y: -250)
//
                VStack {
                    
             
//                    Text("go ahead")
//                        .font(.system(size: 100))
//                        .foregroundColor(.white)
//                        .fontWeight(.ultraLight)
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal, 0)
//
//                    Spacer()
//                        .frame(height: 50)
//
                    Text("We'll help you both")
                        .font(.system(size: 25))
                        .italic()
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 0)
                   
                    Spacer()
                        .frame(height: 20)
                    
                    
                    Text("through this drama")
                        .font(.system(size: 25))
                        .italic()
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 0)
            
                    Spacer()
                        .frame(height: 20)
                    
                    Text("minimizing the wreckage.")
                        .font(.system(size: 25, weight: .bold))
                        .italic()
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                    
                    VStack {
                    
                  
                    Spacer()
                        .frame(height: 40)
                    
                    Text("To find your smile!")
                        .font(.system(size: 35, weight: .bold))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 0)
                    
                    
                    Spacer()
                        .frame(height: 50)
                
                    
                    NavigationLink(
                        destination: DramaMainView(),
                        label: {
                            Text("Ready?")
                                .fontWeight(.light)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 100, height: 30, alignment: .leading)
                                .font(.system(size: 30))
                                .padding(10)
                                .background(Color.gray)
                                .cornerRadius(15)
                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        })
                               
                 }
                      }
                    
               }
            }
        
}
}
struct FightWithFriend_Previews : PreviewProvider {
    static var previews: some View {
        FightWithFriend()
    }
}


