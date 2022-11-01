//
//  BuiltForTeens.swift
//  BestFriends
//
//  Created by Social Tech on 8/30/22.
//



import Foundation
import SwiftUI


struct BuiltForTeens: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: User
//    let atmosphere: Atmosphere
//    let friends: [User]
//    let groups: [Group]
//    let friendAtmospheres: [Atmosphere]
//    
    var body: some View {
        ZStack {
//            ColorManager.grey3
//                .ignoresSafeArea()
//                .onAppear()
            
            Image("lampblue")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            
//            AdPlayerView(name: "sky2")
//                .ignoresSafeArea()
//                .blendMode(.screen)

            
        
         
             
            VStack {
                Text("building")
                    .font(.system(size: 30))
                    .italic()
                    .foregroundColor(ColorManager.grey1)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
          
                Text("FriendGroups")
                    .font(.system(size: 63))
                
                    .foregroundColor(ColorManager.grey1)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
               
                
                Spacer()
                    .frame(height: 15)
                
                
                     
                     Text("- standing together in the storm \n- always having each other's backs \n- never giving up on each other \n- each of us uniquely special")
                         .font(.system(size: 23))
                     
                         .fontWeight(.thin)
                         .foregroundColor(Color.white)
                         .padding()
 //
                Spacer()
                    .frame(height: 100)
            
                    VStack {


                        NavigationLink(
                            destination: InfoViewPlanet(user: user),
                            label: {
                                Text("Walk-through")
                                    .fontWeight(.thin)
                                    .frame(width: 200, height: 30)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .font(.system(size: 25))
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)

                            })
                        
                        Spacer()
                            .frame(height: 20)
//
//                        Link(destination: URL(string: "https://socialtechlabs.com/teen-team/")!) {
//                                Text("Meet some of our Teens")
//                                    .fontWeight(.thin)
//                                    .frame(width: 310, height: 40)
//                                    .font(.system(size: 30))
//                                    .foregroundColor(.white)
//                                    .background(ColorManager.pmbc_blue)
//                                    .cornerRadius(15)
//                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                                    .opacity(0.8)
//
//                        }

                     
//
//                        Link(destination: URL(string: "https://socialtechlabs.com/our-story/")!) {
//
//                            Text("Our Story")
//                                .fontWeight(.thin)
//                                .frame(width: 250, height: 40)
//                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                .font(.system(size: 25))
//                                .background(ColorManager.pmbc_green)
//                                .cornerRadius(15)
//                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                        }
                        
                        Spacer()
                            .frame(height: 40)
//
//                        Button(action: {
//                            sessionManager.showLogin()
//                        },
//                            label: {
//                                Text("Home")
//                                    .fontWeight(.thin)
//                                    .frame(width: 100, height: 40)
//                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                    .font(.system(size: 30))
//                                    .background(ColorManager.purple3)
//                                    .cornerRadius(15)
//                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                            })
//

                        
                        



//
                      
                 
                        
                    }
                }
                
            }
}
    }

        
    
    
//                Text("kickass,")
//                    .font(.system(size: 35))
//
//                    .foregroundColor(ColorManager.purple5)
//                    .fontWeight(.ultraLight)
//                    .multilineTextAlignment(.center)
//
//                Text("resilient,")
//                    .font(.system(size: 40))
//
//                    .foregroundColor(ColorManager.purple4)
//                    .fontWeight(.ultraLight)
//                    .multilineTextAlignment(.center)
//
//                Text("supportive")
//                    .font(.system(size: 45))
//
//                    .foregroundColor(ColorManager.purple3)
//                    .fontWeight(.ultraLight)
//                    .multilineTextAlignment(.center)
//
//                Text("and yep - lasting")
//                    .font(.system(size: 48))
//
//                    .foregroundColor(ColorManager.purple2)
//                    .fontWeight(.ultraLight)
//                    .multilineTextAlignment(.center)
//
//
//
//Text("trying our best to")
////                    .font(.system(size: 25, weight: .bold))
//    .font(.system(size: 35, weight: .bold))
//    .foregroundColor(ColorManager .grey1)
//    .shadow(color: .black, radius: 1, x: 0, y: 1)
//    .opacity(0.50)
////                    .foregroundColor(ColorManager.purple5)
////                    .fontWeight(.ultraLight)
//    .multilineTextAlignment(.center)
//
//
//Text("help you build")
////                    .font(.system(size: 25, weight: .bold))
//    .font(.system(size: 35, weight: .bold))
// .foregroundColor(ColorManager .grey1)
//    .shadow(color: .black, radius: 1, x: 0, y: 1)
//    .opacity(0.50)
////                    .foregroundColor(ColorManager.purple5)
////                    .fontWeight(.ultraLight)
//    .multilineTextAlignment(.center)
//
//Spacer()
//    .frame(height: 10)
