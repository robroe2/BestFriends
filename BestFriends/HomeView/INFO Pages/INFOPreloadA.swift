//
//  INFOPreloadA.swift
//  BestFriends
//
//  Created by Social Tech on 12/16/22.
//



import Foundation
import SwiftUI
import AVKit

struct INFOPreloadA: View {
    
    let user: User
    let friends: [User]
    let groups: [Group]
    //    let atmosphere: Atmosphere
    //
    @State private var showItems: Bool = false
    @State private var offset: CGFloat = 200.0
    
    
    var body: some View {
        
        ZStack {
            //
            //            ColorManager.purple1
            //                .ignoresSafeArea()
            //                .onAppear()
            
            
            
            Image("purpleBackground")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .opacity(0.5)
            
            
            
            AdPlayerView(name: "PaperAirplanes")
                .ignoresSafeArea()
                .blendMode(.screen)
            
            
            ZStack{
                
                NavigationLink(destination: INFOPreload2(user: user), label: {
                    InfoCircle (color: ColorManager.purple1, friendName: "Enjoying \nhappier \nFriendships")
                })
                .offset(x: showItems ? -80 : 0, y: showItems ? -200: 0)
                .shadow(color: ColorManager .purple1, radius: 4, x: 4, y: 4)
                
                
                
                
                NavigationLink(destination: BuggingPreload1(user: user, friends: friends, groups: groups), label: {
                    InfoCircle (color: ColorManager .purple1, friendName: "Reducing \n FriendGroup \nDrama")
                })
                .offset(x: showItems ? 120 : 0, y: showItems ? -150: 0)
                .shadow(color: ColorManager .purple1, radius: 4, x: 4, y: 4)
                
                
                
                ZStack {
                    
//
//                    NavigationLink(destination: INFOPreload2(user: user), label: {
//                        InfoCircle (color: ColorManager.purple3, friendName: "World FriendGroups... \nAll of us, \nat same time, \ntogether")
//                    })
//                    .offset(x: showItems ? -75 : 0, y: showItems ? 180: 0)
//                    .shadow(color: ColorManager .purple1, radius: 4, x: 4, y: 4)
                    
                    
                    NavigationLink(destination: INFOPreload3(user: user), label: {
                        InfoCircle (color: ColorManager.purple3, friendName: "Who's, \nusing \nBestFrinds?")
                    })
                    .offset(x: showItems ? 120 : 0, y: showItems ? 120: 0)
                    .shadow(color: ColorManager .purple1, radius: 4, x: 4, y: 4)
                    
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(ColorManager .grey2)
                        .frame(width: 250, height: 250)
                    //                    .blur(radius: 2)
                        .shadow(color: ColorManager .purple5, radius: 65, x: 30, y: 50) .opacity(0.99)
                    
                    VStack {
                        
                        Spacer ()
                            .frame(height: 250)
                        
                        Text("5 minutes \ndaily")
                            .font(.system(size: 25))
                        
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                        
                        Spacer ()
                            .frame(height: 15)
                        
                        Text("All of us together, \nsimotaniously")
                            .font(.system(size: 25))
                        
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                        
                        Spacer ()
                            .frame(height: 15)
                        
                        Text("TAP circles")
                            .font(.system(size: 20))
                            .italic()
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                       
                        Spacer ()
                            .frame(height: 57)
                        
                      
                        
                        
                        
                        
                        Spacer ()
                            .frame(height: 100)
                      
                        
                        VStack {
                            
                        }
                        
                        Spacer()
                            .frame(height: 75)
                    }
                }
                
                
                
                .onTapGesture {
                    withAnimation {
                        self.showItems.toggle()
                    }
                    print("tap function is working")
                }
                
                .animation(Animation.easeInOut(duration: 2.5), value: showItems)
                
            }
        }
    }
    
    
    struct InfoCircle: View {
        var color: Color
        var friendName: String
        
        var body: some View {
            
            ZStack {
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundColor(ColorManager .purple2)
                    .frame(width: 150, height: 150)
                    .shadow(color: ColorManager .grey3, radius: 5, x: 5, y: 5)
                
                Text(friendName)
                    .fontWeight(.light)
                    .italic()
                    .foregroundColor(.black)
                
            }
        }
    }
    
    
}
