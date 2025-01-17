//
//  RRGuysTexting.swift
//  BestFriends
//
//  Created by Social Tech on 1/20/24.
//



import Foundation
import SwiftUI

struct RRGuysTexting: View {
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
            
            AdPlayerView(name: "sky2")
                .ignoresSafeArea()
                .blendMode(.screen)
            
            //            Image("BuiltByTeens 1")
            //                .resizable()
            //                .ignoresSafeArea()
            //                .onAppear()
            
            
            
            VStack {
                
                Text("as you reach for your truest happiness")
                    .font(.system(size: 22))
                 
                    .foregroundColor(Color.white)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .opacity(0.9)
          
                Spacer ()
                    .frame(height: 10)
                
                
                Text("we keep our word")
                    .font(.system(size: 17))
                    .italic()
                    .foregroundColor(Color.white)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .opacity(0.9)
                
                ZStack {
                    //        *************************************
                    
                    
                    
                    //         ********************************************
                    
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.purple)
                        .frame(width: 550, height: 550)
                        .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                        .opacity(0.8)
                    
                    VStack {
                        
//                        Text("you reach for your truest happiness")
//                            .font(.system(size: 25))
//                            .italic()
//                            .foregroundColor(Color.white)
//                            .fontWeight(.regular)
//                            .multilineTextAlignment(.center)
//                            .opacity(0.9)
//                        
//                        Text("we keep our word")
//                            .font(.system(size: 25))
//                        
//                            .foregroundColor(Color.white)
//                            .fontWeight(.regular)
//                            .multilineTextAlignment(.center)
//                            .opacity(0.9)
                        
                        
                        Spacer ()
                            .frame(height: 20)
                        
                        HStack {
                            
                            
                            //  ***********************************
                            
                            
                            //                            ZStack {
                            //
                            //                                Image("comicBubble")
                            //                                    .resizable()
                            //                                    .foregroundColor(ColorManager .orange3)
                            //                                    .frame(width: 150, height: 110)
                            //                                    .shadow(color: ColorManager .purple1, radius: 3, x: 3, y: 3)
                            //                                    .rotationEffect(.degrees(-10))
                            //                                    .blinking(duration: 3.0)
                            //                                    .opacity(0.9)
                            //
                            //                                VStack {
                            //
                            //                                    Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeR-uflz8Y3slsu8utnYIoN9QPKL4Dx6-sOh6r30Y8yB5I5VQ/viewform")!) {
                            //
                            //
                            //
                            //                                        VStack {
                            //                                            Text("your \nfeedback")
                            //                                                .font(.system(size: 15))
                            //                                                .fontWeight(.regular)
                            //                                                .multilineTextAlignment(.center)
                            //                                                .rotationEffect(.degrees(-10))
                            //                                                .blinking(duration: 3.0)
                            //                                                .foregroundColor(ColorManager .grey2)
                            //                                       Spacer ()
                            //                                                .frame(height: 5)
                            //                                        }
                            //
                            //                                    }
                            //                                }
                            //                                }
                            //
                            
                            
                            //**********************************************************
                        }
                        
                        
                        Text("We're all here to help you...")
                            .font(.system(size: 15))
                            .italic()
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .opacity(0.9)
                        
                        Spacer ()
                            .frame(height: 5)
                        
                        Text("live to your fullest potential")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .opacity(0.9)
                        
                        
                        Text("a little unsure, bolster your self-esteem")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .opacity(0.9)
                        
                        Spacer ()
                            .frame(height: 60)
                        
                        Text("And most importantly")
                            .font(.system(size: 15))
                            .italic()
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .opacity(0.9)
                        
                        Spacer ()
                            .frame(height: 5)
                        
                        Text("support you as you dare")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .opacity(0.9)
                        
                        Text("chase down your most precious dreams")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .opacity(0.9)
                        
                        
                        Spacer ()
                            .frame(height: 70)
                        
                        VStack {
                            NavigationLink(
                                destination:  RR59(user: user, friends: friends, groups: groups, atmosphere: atmosphere, friendAtmospheres: friendAtmospheres),
                                label: {
                                    
                                    ZStack {
                                        Text("Me...")
                                            .fontWeight(.light)
                                            .frame(width: 200, height: 40)
                                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            .font(.system(size: 25))
                                            .background(Color.cyan)
                                            .cornerRadius(10)
                                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                                        
                                        
                                    }
                                })
                            
                            
                            Spacer()
                                .frame(height: 10)
                            
                            
                            
                            VStack {
                                
                                Button(action: {
                                    sessionManager.showLogin()
                                },
                                       label: {
                                    Image("home-alt2")
                                        .frame(width: 60, height: 30)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                        .background(ColorManager .grey4)
                                        .cornerRadius(15)
                                        .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                                        .opacity(0.70)
                                    
                                })
                            }
                        }
                    }
                    
                    
                    
                    
                    
                    
                    Spacer()
                        .frame(height: 40)
                    
                }
            }
        }
    }
}

 
