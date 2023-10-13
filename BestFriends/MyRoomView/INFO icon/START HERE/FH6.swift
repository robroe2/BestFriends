//
//  FH6.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/7/23.
//


import Foundation
import SwiftUI

struct FH6: View {
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
                        
                        
                        Spacer()
                            .frame(height: 40)
                        
                        
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("No feelings of not")
                            .font(.system(size: 20))
                            .foregroundColor(ColorManager.grey1)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                        
                        Text("being good enough")
                            .font(.system(size: 20))
                            .foregroundColor(ColorManager.grey1)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(height: 15)
                        
                        VStack {
                            
                            
                            Text("You're")
                                .fontWeight(.medium)
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .glow(color: ColorManager.purple4, radius: 3)
                                .opacity(0.15)
                            
                            Text("Safe & Sound")
                                .fontWeight(.medium)
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .glow(color: ColorManager.purple4, radius: 3)
                                .opacity(0.15)
                            
                            Spacer()
                                .frame(height: 15)
                            
                            Text("No FOMO")
                                .font(.system(size: 20))
                                .foregroundColor(ColorManager.grey1)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Text("No comparisons")
                                .font(.system(size: 20))
                                .foregroundColor(ColorManager.grey1)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            //
                            //                        Text("(No 'likes' / 'comments'")
                            //                            .font(.system(size: 20))
                            //                            .foregroundColor(ColorManager.grey1)
                            //                            .fontWeight(.light)
                            //                            .multilineTextAlignment(.center)
                            
                        }
                    }
                }
                VStack {
                    
                    Spacer()
                        .frame(height: 30)
                    
                    VStack {
                        
                        Button(action: {
                            sessionManager.showLogin()
                        },
                               label: {
                            Image("home-alt2")
                                .frame(width: 60, height: 30)
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .background(ColorManager .grey3)
                                .cornerRadius(15)
                                .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                                .opacity(0.70)
                            
                        })
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                }
                
            }
            
        }
        
    }
    
}


















