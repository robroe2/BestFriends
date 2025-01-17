//
//  RRMotivationCH.swift
//  BestFriends
//
//  Created by Social Tech on 12/27/23.
//


import Foundation
import SwiftUI
import AVKit

struct RRMotivationCH: View {
    
    let user: User
    let friends: [User]
    let groups: [Group]
    let atmosphere: Atmosphere
    let friendAtmospheres: [Atmosphere]
    
    @State private var showItems: Bool = false
    @State private var offset: CGFloat = 200.0
    
 
    //**************************
    @State var animate: Bool = false
    let animation: Animation = Animation.linear(duration:3.0).repeatForever(autoreverses: false)
    //**************************
    
    
    var body: some View {
        
        ZStack {
            Color.black
                .opacity(0.9)
                .ignoresSafeArea()
            
//            AdPlayerView(name: "background_7")
//                .ignoresSafeArea()
//                .blendMode(.screen)
//                .opacity(0.5)
            
            AdPlayerView(name: "sky2")
                .ignoresSafeArea()
                .blendMode(.screen)
                .opacity(0.3)
            
            AdPlayerView(name: "background_7")
                .ignoresSafeArea()
                .blendMode(.screen)
                .opacity(0.9)
            
            ZStack{
  
                    VStack {
                        
                        Spacer()
                            .frame(height: 130)
                        //  *************************************************
                        
                        
                        //    *******************************************
                        
                        //                        HStack {
                        //                            VStack {
                        //                                NavigationLink(destination: SendKisses(user: user, friends: friends), label: {
                        //                                    HugCircle (color: Color.cyan, friendName: "Blowing \nKisses")
                        //                                })
                        //                                .offset(x: showItems ? -80 : 0, y: showItems ? 220: 0)
                        //                                .shadow(color: Color.blue, radius: 5, x: -2, y: -2)
                        //                                .opacity(0.99)
                        //                            }
                        //
                        //
                        //                            Spacer()
                        //                                .frame(width: 20)
                        //
                        //                            NavigationLink(destination: HugPushNotification(user: user, friends: friends), label: {
                        //                                HugCircle (color: Color.cyan, friendName: "Hugs")
                        //                            })
                        //                            .offset(x: showItems ? -100 : 0, y: showItems ? -140: 0)
                        //                            .shadow(color: Color .blue, radius: 5, x: 2, y: -2)
                        //                            .opacity(0.99)
                        //                        }
                        //    **********************************************
                        //                        Spacer()
                        //                            .frame(height: 10)
                        
                        VStack {
                            
                            HStack {
                                NavigationLink(destination: RR27(user: user, friend: user, friends: friends, groups: groups), label: {
                                    HugCircle (color: ColorManager .grey1, friendName: "Wishing \nfriend\n good luck")
                                })
                                .offset(x: showItems ? -80 : 0, y: showItems ? 220: 0)
                                .shadow(color: Color.white, radius: 5, x: -2, y: -2)
                                .opacity(0.8)
                                
                                Spacer ()
                                    .frame(width: 100)
                                
                                
                                NavigationLink(destination: RR12(user: user, friend: user, friends: friends, groups: groups), label: {
                                    HugCircle (color: ColorManager .grey1, friendName: "Say \nCONGRATS!")
                                })
                                .offset(x: showItems ? -80 : 0, y: showItems ? 220: 0)
                                .shadow(color: Color.white, radius: 5, x: -2, y: -2)
                                .opacity(0.8)
                                
                                
                            }
                        }
                       
                        
                Spacer ()
                            .frame(height: 100)
                        
                        
                        //        *************************** Center
                        HStack {
                            //                        Spacer ()
                            //                            .frame(width: 40)
                            //
                            //                        NavigationLink(destination: SaySomethingNice7(user: user, friend: user, friends: friends, groups: groups), label: {
                            //                            HugCircle (color: Color.cyan, friendName: "Hang \nout")
                            //                        })
                            //                        .offset(x: showItems ? -100 : 0, y: showItems ? -140: 0)
                            //                        .shadow(color: Color .blue, radius: 5, x: 2, y: -2)
                            //                        .opacity(0.99)
                            //
                            //
                            //                        Spacer()
                            //                            .frame(width: 75)
                            
                            ZStack {
                                
//                                Image("planet_6")
//
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 120, height: 120)
//                                    .foregroundColor(Color.orange)
//                                    .opacity(0.95)
//
                                
//                                NavigationLink(
//                                    destination:  PhotoPopView(user: user, friends: friends),
//                                    label: {
//
//                                        Image("IconPhotoNew")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 70, height: 70)
//                                            .foregroundColor(Color.purple)
//                                            .glow(color: Color.white, radius: 0.3)
//                                            .shadow(color: .white, radius: 1, x: 3, y: -0.5)
//                                            .opacity(0.95)
//
//                                    })
                            }
                            
                            //
                            //                        Spacer()
                            //                            .frame(width: 75)
                            //
                            //
                            //                        NavigationLink(destination: CH4(user: user, friend: user, friends: friends, groups: groups), label: {
                            //                            HugCircle (color: Color.cyan, friendName: "Sad \nDay \nSong")
                            //                        })
                            //                        .offset(x: showItems ? -100 : 0, y: showItems ? -140: 0)
                            //                        .shadow(color: Color .blue, radius: 5, x: 2, y: -2)
                            //                        .opacity(0.99)
                        }
                        
                        //      *************************
                        
                        
                        
                        HStack {
                            
                            ZStack {
                                NavigationLink(destination: SendHomie(user: user, friends: friends), label: {
                                    HugCircle (color: ColorManager .grey1, friendName: "Send a \nFist-pump")
                                })
                                .offset(x: showItems ? -80 : 0, y: showItems ? 220: 0)
                                .shadow(color: Color.white, radius: 5, x: -2, y: -2)
                                .opacity(0.8)
                                
                            }
                            
                            Spacer()
                                .frame(width: 100)
                            
                            
                            
                            
                            ZStack {
                                
                                
                                NavigationLink(destination: RRgreatDay(user: user, friends: friends), label: {
                                    HugCircle (color: ColorManager .grey1, friendName: "I'm having \na great \nday!!!")
                                })
                                .offset(x: showItems ? -80 : 0, y: showItems ? 220: 0)
                                .shadow(color: Color.white, radius: 5, x: -2, y: -2)
                                .opacity(0.8)
                                
                            }
                        }
                        
                        //                    HStack {
                        //                        VStack {
                        //                            NavigationLink(destination: SendHomie(user: user, friends: friends), label: {
                        //                                HugCircle (color: Color.purple, friendName: "Send a \nFist- \nPump")
                        //                            })
                        //                            .offset(x: showItems ? 30 : 0, y: showItems ? -170: 0)
                        //                            .shadow(color: Color.purple, radius: 10, x: -4, y: 4)
                        //                            .opacity(0.99)
                        //                        }
                        //
                        //
                        //                        Spacer()
                        //                            .frame(width: 35)
                        //
                        //                        NavigationLink(destination: RR12(user: user, friend: user, friends: friends, groups: groups), label: {
                        //                            HugCircle (color: ColorManager .purple5, friendName: "Say \nCongrats!")
                        //                        })
                        //                        .offset(x: showItems ? -120 : 0, y: showItems ? 100: 0)
                        //                        .shadow(color: Color.purple, radius: 10, x: -4, y: 4)
                        //                        .opacity(0.99)
                        //                    }
                        
                        
                        VStack {
                            
                            Spacer()
                                .frame(width: 140)
                            
//
//                            ZStack {
//
//                                //*********************************************** Motion
//                                GeometryReader { geo in
//                                    HStack(spacing: 280) {
//
//                                        Image("")
//                                            .aspectRatio(contentMode: .fit)
//                                        //                                        .blinking(duration: 6.0)
//
//                                        Spacer()
//                                            .frame(width: 50)
//
//                                        ZStack {
//
//
//                                            //                                        NavigationLink(destination: RR12(user: user, friend: user, friends: friends, groups: groups), label: {
//                                            Image("FatGuy")
//                                            //                                            .aspectRatio(contentMode: .fit)
//                                                .frame(width: 120, height: 120)
//                                                .blinking(duration: 7.0)
//
//                                            Text("Yep, you got this")
//                                                .fontWeight(.medium)
//                                                .frame(width: 250, height: 40)
//                                                .foregroundColor(Color.black)
//                                                .font(.system(size: 30))
//                                                .background(ColorManager .purple1)
//                                                .cornerRadius(7)
//                                                .rotationEffect(.degrees(-25))
//                                                .opacity(0.8)
//                                            //                                            .glow(color: ColorManager .grey4, radius: 3)
//                                                .shadow(color: ColorManager .purple3, radius: 2, x: 0, y: 3)
//                                                .blinking(duration: 7.0)
//
//
//                                        }
//                                        //                                    )}
//
//                                        //**********************************************************
//                                        Image("")
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: geo.size.width, alignment: .leading)
//
//
//
//                                    }
//                                    .frame(width: geo.size.width, height: geo.size.height,
//                                           alignment: animate ? .trailing : .leading)
//                                }
//                                .ignoresSafeArea()
//                                .onAppear {
//                                    withAnimation(animation) {
//                                        animate.toggle()
//                                    }
//
//                                }
//                            }
                            
                            
                            //    ********************************************
                            
                            //    ********************************************
                            
                            
                            VStack {
                                
                                Spacer ()
                                    .frame(height: 100)
                                
                                
                                HStack {
                                    
                                    ZStack {
                                        Image("")
                                        //
                                        //
                                        //                                    NavigationLink(destination: CH4(user: user, friend: user, friends: friends, groups: groups), label: {
                                        //                                        HugCircle (color: Color.cyan, friendName: "Sad \nDay \nSong")
                                        //                                    })
                                        //                                    .offset(x: showItems ? -100 : 0, y: showItems ? -140: 0)
                                        //                                    .shadow(color: Color .blue, radius: 5, x: 2, y: -2)
                                        //                                    .opacity(0.99)
                                        
                                    }
                                    
                                    Spacer()
                                        .frame(width: 190)
                                    
                                    //                                ZStack {
                                    //
                                    //                                    NavigationLink(destination: CH6(user: user, friend: user, friends: friends, groups: groups), label: {
                                    //                                        HugCircle (color: ColorManager .grey1, friendName: "Build \nyour own \n'in-beta'")
                                    //                                    })
                                    //                                    .offset(x: showItems ? 85 : 0, y: showItems ? 400: 0)
                                    //                                    .shadow(color: Color.cyan, radius: 4, x: 2, y: 3)
                                    //                                    .opacity(0.99)
                                    //                                }
                                    
                                }
                                
                                ZStack {
                                    
                                    
                                    
                                }
                                
                            }
                            
                            VStack {
                                
                                Spacer ()
                                    .frame(height: 110)
                                
                            }
                        }
                    }
                    
                    
                    .onTapGesture {
                        withAnimation {
                            self.showItems.toggle()
                        }
                        print("tap function is working")
                    }
                    
                    .animation(Animation.easeInOut(duration: 1.7), value: showItems)
                    
                }
            }
        }
        
        
        struct HugCircle: View {
            var color: Color
            var friendName: String
            
            var body: some View {
                
                ZStack {
                    
//                    Image("iconSphere2")
//                        .resizable()
//                        .foregroundColor(color)
//                    //                            .foregroundColor(ColorManager .purple2)
//                        .frame(width: 120, height: 120)
//                        .shadow(color: Color.white, radius: 6, x: 0, y: 0)
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(color)
                        .foregroundColor(ColorManager .grey2)
                        .frame(width: 80, height: 80)
                        .opacity(0.3)
                        .shadow(color: Color.white, radius: 10, x: 5, y: 5)
                    
                    Text(friendName)
                        .fontWeight(.bold)
                        .font(.system(size: 13))
                        .italic()
                        .foregroundColor(.black)
                    
                }
            }
        }
    }
    

