//
//  RRPoemContest.swift
//  BestFriends
//
//  Created by Social Tech on 12/26/23.
//



import Foundation
import SwiftUI

struct RRPoemContest: View {
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
            
//            ColorManager .grey1
//                .ignoresSafeArea()
//                .opacity(0.2)
            
                        AdPlayerView(name: "sky2")
                            .ignoresSafeArea()
                            .blendMode(.screen)
                            .opacity(0.5)
            
            AdPlayerView(name: "easyHearts2")
                .ignoresSafeArea()
                .blendMode(.screen)
                .opacity(0.9)
            
            //          ********************************************
            
            VStack {
                
                
                
                Text("Two souls whose stories forever")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .rotationEffect(.degrees(-20))
                //                            .blinking(duration: 3.0)
                    .shadow(color: ColorManager .grey3, radius: 0.7, x: 0.5, y: 0.5)
                    .opacity(0.9)
                
                Text("etched in the laugh lines and")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .rotationEffect(.degrees(-20))
                //                            .blinking(duration: 3.0)
                    .shadow(color: ColorManager .grey3, radius: 0.7, x: 0.5, y: 0.5)
                    .opacity(0.9)
                
                Text("dreams swiriling behind their eyes.")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .rotationEffect(.degrees(-20))
                //                            .blinking(duration: 3.0)
                    .shadow(color: ColorManager .grey3, radius: 0.7, x: 0.5, y: 0.5)
                    .opacity(0.9)
                
                
                Text("-- Thays from Brazil")
                    .font(.system(size: 10))
                    .italic()
                    .fontWeight(.bold)
                    .italic()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .rotationEffect(.degrees(-20))
                //                            .blinking(duration: 3.0)
                    .shadow(color: ColorManager .grey3, radius: 0.7, x: 0.5, y: 0.5)
                    .opacity(0.9)
                
                
                
                
                
                Spacer ()
                    .frame(height: 30)
                
                HStack {
                    
                    
                    Spacer ()
                        .frame(width: 20)
                    
                    //
                    //            VStack {
                    
                    ZStack {
                        
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(ColorManager .grey2)
                            .rotationEffect(.degrees(10))
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(ColorManager .grey2)
                            .frame(width: 150, height: 120)
                            .shadow(color: ColorManager .grey1, radius: 3, x: 3, y: 3)
                            .rotationEffect(.degrees(10))
                            .opacity(0.3)
                        
                        
                        
                        Link(destination: URL(string: "https://socialtechlabs.com/white-linen-dress/")!) {
                            
                            VStack {
                                Text("new poem \n\ncoming")
                                    .font(.system(size: 20))
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(ColorManager .grey1)
                                    .rotationEffect(.degrees(10))
                                    .opacity(0.99)
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            }
                        }
                    }
                    
                    
                    Spacer ()
                        .frame(width: 30)
                    
                    
                    
                    ZStack {
                        
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(ColorManager .grey2)
                            .frame(width: 140, height: 110)
                            .shadow(color: ColorManager .grey1, radius: 3, x: 3, y: 3)
                            .rotationEffect(.degrees(-10))
                            .opacity(0.4)
                        
                        
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(ColorManager .grey2)
                            .rotationEffect(.degrees(-10))
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(ColorManager .grey2)
                            .frame(width: 150, height: 120)
                            .shadow(color: ColorManager .grey1, radius: 3, x: 3, y: 3)
                            .rotationEffect(.degrees(-10))
                            .opacity(0.3)
                        
                        Link(destination: URL(string: "https://socialtechlabs.com/a-kisses-journey/")!) {
                            
                            VStack {
                                Text("new poem \n\ncoming")
                                    .font(.system(size: 20))
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(ColorManager .grey1)
                                    .rotationEffect(.degrees(-10))
                                    .opacity(0.99)
                                
                            }
                        }
                    }
                }
                
                
                
                Spacer ()
                    .frame(height: 30)
                
    //    ********************************************************
                

                        HStack {
                            
                            ZStack {
                                       
                                        Link(destination: URL(string: "https://socialtechlabs.com/a-kisses-journey/")!) {
                                            
                                            ZStack {
                                                
                                                VStack {
                                                    
                                                    Text("a kisses' \njourney")
                                                        .font(.system(size: 20))
                                                        .fontWeight(.light)
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(ColorManager .grey4)
                                                        .rotationEffect(.degrees(-10))
                                                        .opacity(0.99)
                                                }
                                                
                                                Image(systemName: "heart")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 175, height: 150)
                                                    .foregroundColor(Color.cyan)
                                                    .opacity(0.1)
                                                    .rotationEffect(.degrees(-10))
                                                    .glow(color: Color.purple, radius: 1)
                                                    .shadow(color: Color.purple, radius: 2, x: 0, y: 3)
                                                
                                                Image(systemName: "heart.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 160, height: 140)
                                                    .foregroundColor(ColorManager .purple3)
                                                    .opacity(0.1)
                                                    .glow(color: Color.white, radius: 1)
                                                    .shadow(color: Color.white, radius: 2, x: 0, y: 3)
                          
                                        
                                    }
                                }
                            }
                            
    //        ***********************************
                            Link(destination: URL(string: "https://socialtechlabs.com/white-linen-dress/")!) {
                                
                                ZStack {
                                    
                                    VStack {
                                        
                                        Text("white linen \ndress")
                                            .font(.system(size: 20))
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(ColorManager .grey4)
                                            .rotationEffect(.degrees(10))
                                            .opacity(0.99)
                                    }
                                    
                                    Image(systemName: "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 175, height: 150)
                                        .foregroundColor(Color.cyan)
                                        .opacity(0.1)
                                        .rotationEffect(.degrees(10))
                                        .glow(color: Color.purple, radius: 1)
                                        .shadow(color: Color.purple, radius: 2, x: 0, y: 3)
                                    
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 160, height: 140)
                                        .foregroundColor(ColorManager .purple3)
                                        .opacity(0.1)
                                        .glow(color: Color.white, radius: 1)
                                        .shadow(color: Color.white, radius: 2, x: 0, y: 3)
              
                                    Spacer()
                                        .frame(width: 50)
                                    

                                }
                            }
                        }
                
                
                
    VStack {
  
            Text("Coming summer ...")
                .font(.system(size: 15))
                .italic()
                .foregroundColor(ColorManager .grey3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .opacity(0.7)
                                           
            Spacer()
                .frame(height: 10)
                                           
            Text("Submit your heartfelt")
                .font(.system(size: 25))
                .foregroundColor(ColorManager .grey3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .opacity(0.99)
                             
            VStack {
                
                Text("romantic poems")
                    .font(.system(size: 25))
                
                    .foregroundColor(ColorManager .grey3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .opacity(0.99)
                
                
                
                
                VStack {
                    
                    NavigationLink(
                        destination: RRPoemContest2(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                        label: {
                            Text("Contest details")
                                .fontWeight(.thin)
                                .frame(width: 200, height: 40)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 25))
                                .background(Color.cyan)
                                .cornerRadius(10)
                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                            
                        }
                    )}
                
            
                        
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
                                    .background(ColorManager .grey4)
                                    .cornerRadius(15)
                                    .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                                    .opacity(0.70)
                                
                            })
                        }
                                               
                                               Spacer()
                                                   .frame(height: 140)
                                               
                                               
                    }
                }
            }
        }

            }
        }




        


















