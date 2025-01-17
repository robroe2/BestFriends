//
//  FH8.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/7/23.
//



import Foundation
import SwiftUI

struct FH8: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    
    let user: User
    let atmosphere: Atmosphere
    let friends: [User]
    let friendAtmospheres: [Atmosphere]
    let groups: [Group]
    
    @State private var selectedFriends: [String] = []
    @State private var colors: [Color] = [ColorManager.purple3, ColorManager.purple3, ColorManager.purple3, ColorManager.purple3, ColorManager.purple3]
    @State private var shareColor = ColorManager.purple5
    @State private var showingAlert = false
    
    @State private var counter = 0
    
    @State private var mood: Int = -1
    @State private var summary = ""
    @State private var sharedWith: [String] = []
    @State private var colorChangeTap: String = ""
    @State private var shareTapped: Bool = false
    
    var body: some View {
        //        ScrollView {
        
        ZStack {
            
            Color.black
                .opacity(0.9)
                .ignoresSafeArea()
            
            AdPlayerView(name: "Planet4")
                .ignoresSafeArea()
                .blendMode(.screen)
            
            
            VStack {
                
                HStack {
                    Text("")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .blinking(duration: 2.0)
                    
                    Spacer()
                        .frame(width: 100)
                    
                    ZStack {
                        
                        Image("comicBubble")
                            .resizable()
                            .foregroundColor(Color.cyan)
                            .frame(width: 350, height: 140)
                            .shadow(color: Color.cyan, radius: 3, x: 3, y: 3)
                            .opacity(0.5)
                            .blinking(duration: 2.0)
                        
                        VStack {
                            
                            Text("Provide emotional support")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .blinking(duration: 2.0)
                            
                            Text("on difficult days")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .blinking(duration: 2.0)
                        }
                    }
                }
                
                
                //****************************************************
                VStack {
                    
                    
                    
                    ZStack {
                        
                        Spacer()
                            .frame(height: 70)
                        
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: 375, height: 375)
                            .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                            .opacity(0.5)
                        
                        VStack {
                            
                            Text("Sending")
                                .font(.system(size: 45))
                                .foregroundColor(Color.white)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            
                            Text("CareHearts")
                                .font(.system(size: 45))
                                .foregroundColor(Color.white)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            Spacer()
                                .frame(height: 30)
                            
                            Text("Perfect")
                                .font(.system(size: 22))
                                .foregroundColor(ColorManager .grey1)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                            
                            
                            Text("for celebrating good days,")
                                .font(.system(size: 22))
                                .foregroundColor(ColorManager .grey1)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                            
                            
                            
                            Spacer()
                                .frame(height: 20)
                            
                            NavigationLink(destination:HugPreload(user: user, friends: friends, groups: groups, atmosphere: atmosphere, friendAtmospheres: friendAtmospheres),
                                           label: {
                                Text("CareHearts")
                                    .fontWeight(.regular)
                                    .frame(width: 150, height: 33)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 13))
                                    .background(Color.orange)
                                    .cornerRadius(15)
                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                
                            })
                            
                        }
                        
                    }
                    VStack {
                        
                        Spacer()
                            .frame(height: 30)
                        
                        
                        
                        NavigationLink(
                            destination: FH7(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                            label: {
                                Text("->")
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .font(.system(size: 30))
                                    .background(ColorManager .grey2)
                                    .opacity(0.95)
                                    .cornerRadius(5)
                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                            }
                            
                        )}
                    
                    
                    
                    
                    Spacer()
                        .frame(height: 85)
                    
                }
                
            }
            
        }
        
    }
}
