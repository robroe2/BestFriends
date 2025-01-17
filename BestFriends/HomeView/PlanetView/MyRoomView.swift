//
//  MyRoomView.swift
//  BestFriends
//
//  Created by Alex Titov on 6/8/23.
//

import SwiftUI

struct MyRoomView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: User
    let atmosphere: Atmosphere
    let friends: [User]
    let friendAtmospheres: [Atmosphere]
    let groups: [Group]
    
    
    //    @State private var homeData: HomeData?
    //    @State private var groups: [Group] = []
    //    @State private var planets: [Planet] = []
    
    @State private var inviteClicked = false
    //    @State private var focusPlanet = false
    //    @State private var showNewRoomNameDialog = false
    
    //    @State private var newGroupMembers: [String] = []
    
    //    @State private var chatGroupsView = ChatGroupsView(user: User(id: "", firstName: "", lastName: "", APNToken: "", atmosphere: "", chatPin: "", chatBackground: ""), groups: [])
    
    //    @State private var presentingPhotoPop = false
    @State private var presentingIANs = false
    
    //    @State private var movingPlanets = false
    
    @State private var scale = 3.0
    
    var body: some View {
        ZStack {
        
            Color.black
                .opacity(0.9)
                .ignoresSafeArea()
            
            
            AdPlayerView(name: "background_8")
                .ignoresSafeArea()
                .blendMode(.screen)
                .opacity(0.99)
            
            VStack {
                
            
//                HStack {
//
//
//                                        NavigationLink(
//                                            destination:  FH10(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                            label: {
//
//                                                Image(systemName: "info.circle")
//                                                    .resizable()
//                                                    .scaledToFit()
//                                                    .frame(width: 37, height: 37)
//                                                    .opacity(0.9)
//                                                    .foregroundColor(.white)
//                                                    .opacity(0.9)
//                                            })
//
//                    Spacer ()
//                        .frame(width: 100)
                    
                    VStack {
                        
                        
                        ZStack {
                            
                            HStack {
                                
                                ZStack {
                                    ZStack {
                                        
                                        //                                        Image(systemName: "heart.fill")
                                        //                                            .resizable()
                                     
                                        //                                            .foregroundColor(ColorManager .purple3)
                                        //                                            .frame(width: 60, height: 55)
                                        //                                            .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                                        //                                            .opacity(0.7)
                                        //
                                        //                                        NavigationLink(
                                        //
                                        //                                            destination: BuiltByTeensView(user: user, friends: friends),
                                        //                                            label: {
                                        //                                                Text("Our \nStory")
                                        //                                                    .fontWeight(.regular)
                                        //                                                    .foregroundColor(Color.white)
                                        //                                                    .font(.system(size: 10))
                                        //
                                        //                                            })
                                        
                                    }
                                    
                                    //                                    Spacer ()
                                    //                                        .frame(width: 40)
                                    //
                                    //                                    Image(systemName: "person.2.fill")
                                    //                                        .resizable()
                                    //                                        .foregroundColor(Color.cyan)
                                    //                                        .frame(width: 30, height: 30)
                                    //                                    //                                        .rotationEffect(.degrees())
                                    //                                        .shadow(color: .white, radius: 2, x: -2, y: 2)
                                    //                                    //                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                    
                                    
//              **********************************************************
                                    
                     
                                    
                                    
//  *********************************************
                                }
                            }
                        }
                    }
                    
//                                        Spacer ()
//                                            .frame(width: 22)
//
//                                        NavigationLink(
//                                            destination:  SettingsView(user: user, friends: friends, atmosphere: atmosphere),
//                                            label: {
//
//                                                Image(systemName: "gear")
//                                                    .resizable()
//                                                    .scaledToFit()
//                                                    .frame(width: 37, height: 37)
//                                                    .opacity(0.9)
//                                                    .foregroundColor(.white)
//                                                    .opacity(0.9)
//                                            })
//
//                                        }
//
                Spacer()
                    .frame(height: 85)
                
                VStack {
                    HStack {
                        
                        
                        ZStack {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color.orange)
                            //                            .blinking(duration: 4.0)
                                .glow(color: ColorManager.orange5, radius: 10)
                            
                            
                            
                            NavigationLink(
                                destination:   FH2(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                                label: {
                                    
                                    Text("Walk \nThrough")
                                        .fontWeight(.regular)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 15))
                                    
                                    //                                    .blinking(duration: 4.0)
                                })
                            
//
                        }
                    }
                }
                //                ******************************* In-app notifications ******************
                
                VStack {
                    
                    //            Spacer()
                    //                .frame(height: 10)
                    
                    HStack {
                        
                        //                ZStack {
                        //
                        //                    Button(action: {
                        //                        sessionManager.showLogin()
                        //                    },
                        //                           label: {
                        //
                        //                        ZStack{
                        //
                        //                            Image(systemName: "heart")
                        //                                .resizable()
                        //                                .scaledToFit()
                        //                                .frame(width: 55, height: 55)
                        //                                .foregroundColor(Color.red)
                        //                                .glow(color: ColorManager.purple4, radius: 3)
                        //                                .opacity(0.5)
                        //
                        //
                        //
                        //                            Text("CareHeart \nAlert")
                        //                                .fontWeight(.regular)
                        //                                .foregroundColor(Color.white)
                        //                                .font(.system(size: 10))
                        //
                        //                        }
                        //                    })
                        //            }
                        //                Spacer()
                        //                    .frame(width: 100)
                        
                        //                Image(systemName: "")
                        //                    .resizable()
                        //                    .scaledToFit()
                        //                    .frame(width: 50, height: 50)
                        //                    .foregroundColor(Color.red)
                        //                    .glow(color: ColorManager.purple4, radius: 3)
                        //                    .opacity(0.5)
                        
                        //                ZStack {
                        //
                        //                    Image(systemName: "heart.fill")
                        //                        .resizable()
                        //                        .foregroundColor(ColorManager .purple3)
                        //                        .frame(width: 60, height: 55)
                        //                        .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                        //                        .opacity(0.7)
                        //
                        //                    NavigationLink(
                        //
                        //                        destination: BuiltByTeensView(user: user, friends: friends),
                        //                        label: {
                        //                            Text("Our \nStory")
                        //                                .fontWeight(.regular)
                        //                                .foregroundColor(Color.white)
                        //                                .font(.system(size: 10))
                        //
                        //                        })
                        //
                        //                }
                    }
                    
                    
                    
                    //     CareHearts ******************************************************
                    
                    
                    //     CareHearts ******************************************************
                    
                    VStack {

//                        Spacer()
//                            .frame(height: 100)



//                        ZStack {
//
//                            NavigationLink(
//                                destination:  CH11(),
//                                label: {
//
//                                    Image("Group 58")
//                                        .resizable()
//                                        .frame(width: 330, height: 170)
//                                        .cornerRadius(20)
//                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                        .opacity(0.6)
//
//
//                                })
                          
                       
                            
                            VStack {
                                
                                VStack {
                                    
//
//                                    Spacer()
//                                        .frame(height: 50)
                                    
                                    HStack {
                                        
//                                        VStack {
//
//
//                                            Spacer()
//                                                .frame(height: 20)
//
//                                            NavigationLink( destination: HugPreload(user: user, friends: friends, groups: groups, atmosphere: atmosphere),
//                                                            label: {
//                                                Text("Sending")
//                                                    .fontWeight(.regular)
//                                                    .frame(width: 100, height: 30)
//                                                    .foregroundColor(ColorManager .purple5)
//                                                    .font(.system(size: 16))
//                                                    .background(ColorManager .purple2)
//                                                    .glow(color: ColorManager.purple3, radius: 1)
//                                                    .shadow(color: .white, radius: 3, x: -4, y: 4)
//                                                    .opacity(0.9)
//                                                    .cornerRadius(7)
//                                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//
//                                            })
                                          
//                                            Spacer()
//                                                .frame(height: 10)
                                            
                                            
                                            
//                                            NavigationLink( destination:  CH10(user: user, friends: friends, groups: groups, atmosphere: atmosphere),
//                                                            label: {
//                                                Text("Receiving")
//                                                    .fontWeight(.regular)
//                                                    .frame(width: 100, height: 30)
//                                                    .foregroundColor(ColorManager .purple5)
//                                                    .font(.system(size: 17))
//                                                    .background(ColorManager .purple2)
//                                                    .glow(color: ColorManager.purple3, radius: 1)
//                                                    .shadow(color: .white, radius: 3, x: -4, y: 4)
//                                                    .opacity(0.9)
//                                                    .cornerRadius(7)
//                                                    .shadow(color: Color.purple, radius: 2, x: 0, y: 2)
//                                            })
                                            
                                            
                                            
                                        }
                                        
                                        Spacer()
                                            .frame(width: 10)
                                        
                                        VStack {
                                            
                                            
                                            
            ZStack {
                                                                                                    
//                NavigationLink( destination: BestFriendMessages(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres),
//                                label: {
//                    Text("")
//                        .fontWeight(.light)
//                        .frame(width: 42, height: 42)
//                        .foregroundColor(ColorManager .grey4)
//                        .font(.system(size: 17))
//                        .background(ColorManager .grey2)
//                        .glow(color: ColorManager.purple3, radius: 1)
//                        .shadow(color: .white, radius: 3, x: -4, y: 4)
//                        .opacity(0.9)
//                        .cornerRadius(25)
//                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//
//                })
//
//
//                Image(systemName: "info.circle")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 37, height: 37)
//                    .opacity(0.9)
//                    .foregroundColor(.white)

                                            }
//
//                                            NavigationLink( destination:  AtmosphereMain2(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                                            label: {
//                                                Text("My \nReal-time \nVibe")
//                                                    .fontWeight(.regular)
//                                                    .frame(width: 90, height: 60)
//                                                    .foregroundColor(ColorManager .purple5)
//                                                    .font(.system(size: 16))
//                                                    .background(ColorManager .purple1)
//                                                    .glow(color: ColorManager.purple3, radius: 1)
//                                                    .shadow(color: .green, radius: 3, x: -4, y: 4)
//                                                    .opacity(0.9)
//                                                    .cornerRadius(7)
//                                                    .shadow(color: Color.green, radius: 2, x: 0, y: 2)
//                                            })
                                        }
                                        
//                                        Spacer()
//                                            .frame(width: 20)
//
//
                    VStack {
                                            
//                        ZStack {
//
//                            Image(systemName: "circle.fill")
//                                .resizable()
//                                .foregroundColor(Color.yellow)
//                                .frame(width: 60, height: 60)
//                                .rotationEffect(.degrees(7))
//                                .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                .opacity(0.8)
//
//
//
//                                NavigationLink( destination:  BestFriendMessages(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres),
//                                        label: {
//                                    Text("Smile \nVault")
//                                        .fontWeight(.light)
//                                        .foregroundColor(Color.black)
//                                        .font(.system(size: 11))
//                                        .rotationEffect(.degrees(7))
//                                        .opacity(0.85)
//
//
//                                                })
//                                            }
//                                        }
//                                    }
                                }
                            }
                        }
                    }
                    
                    
                    //      PhotoPOP ****************************************************
                    
                    Spacer()
                       
                    
                    VStack {
                        
                        HStack {
                            VStack {
                                
                                ZStack {
                                    
                                    
//                                    NavigationLink( destination:  PhotoPopView(user: user, friends: friends),
//                                                    label: {
//                                        Text("Loading \nPhotoPOPs")
//                                            .fontWeight(.bold)
//                                            .frame(width: 300, height: 42)
//                                            .foregroundColor(Color.black)
//                                            .font(.system(size: 16))
//                                            .background(Color.green)
//                                            .glow(color: ColorManager.purple1, radius: 1)
//                                            .shadow(color: .white, radius: 3, x: -4, y: 4)
//                                            .opacity(0.9)
//                                            .cornerRadius(15)
//                                            .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                            .opacity(0.6)
//                                    })
                                    
                                    HStack {
                                        
                                        // ***************************** Pic of the Day ********** After Aug 22 subit to Apple ******
//                                        ZStack {
//
//                                            Image(systemName: "triangle.fill")
//                                                .resizable()
//                                                .foregroundColor(Color.purple)
//                                                .frame(width: 80, height: 55)
//                                            //                            .rotationEffect(.degrees(-7))
//                                                .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                .opacity(0.7)
//                                            //                            .blinking(duration: 2.0)
//
//                                            NavigationLink( destination:  RR5(user: user, friends: friends),
//                                                            label: {
//                                                Text("What \nare my \nfriends doing?")
//                                                    .fontWeight(.light)
//                                                    .foregroundColor(Color.black)
//                                                    .font(.system(size: 10))
//                                                //                                .rotationEffect(.degrees(-7))
//                                                    .opacity(1.0)
//                                                //                                .blinking(duration: 2.0)
//
//
//                                            })
//                                        }
//
                                        
//
//                                        Spacer ()
//                                            .frame(width: 30)
//
                                        //
//                                        ZStack {
//
//                                            Image(systemName: "triangle.fill")
//                                                .resizable()
//                                                .foregroundColor(Color.green)
//                                                .frame(width: 80, height: 55)
//                                            //                                                .rotationEffect(.degrees(7))
//                                                .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                .opacity(0.8)
//
//
//                                            NavigationLink( destination:  PhotoPopView(user: user, friends: friends),
//                                                            label: {
//                                                Text("my \nfavorite \nimage")
//                                                    .fontWeight(.light)
//                                                    .foregroundColor(Color.black)
//                                                    .font(.system(size: 11))
//                                                //                                                    .rotationEffect(.degrees(7))
//                                                    .opacity(0.85)
//
//
//                                            })
//
//                                        }
                                    }
                                }
                            }
                        }
                    }
                        
                        //************************************************ Accessorizing Section **************
       //     Friendships ************************************
             
                    VStack {
                 
                        HStack {
                            
                            VStack {
                                
                                ZStack {
                                    
                                    ZStack {
                                        
//                                        NavigationLink(
//                                            destination:  CH11(),
//                                            label: {
//
//                                                Image("Group 56")
//                                                    .resizable()
//                                                    .frame(width: 335, height: 180)
//                                                    .cornerRadius(20)
//                                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                    .opacity(0.6)
//                                            })
                                        
                                     
                                        
                                        
                                VStack {
                                         
//                                            Spacer()
//                                                .frame(height: 85)
                                            
//                                            NavigationLink( destination:  Step4_NuclearOption(user: user, friends: friends, groups: groups, atmosphere: atmosphere, friendAtmospheres: friendAtmospheres),
//                                                            label: {
//                                                Text("Fixing Fights")
//                                                    .fontWeight(.bold)
//                                                    .frame(width: 300, height: 42)
//                                                    .foregroundColor(Color.black)
//                                                    .font(.system(size: 16))
//                                                    .background(Color.orange)
//                                                    .glow(color: ColorManager.purple1, radius: 1)
//                                                    .shadow(color: .white, radius: 3, x: -4, y: 4)
//                                                    .opacity(0.9)
//                                                    .cornerRadius(15)
//                                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                    .opacity(0.6)
                                                //                                            .blinking()
                                                
                                                
//                                            })
                                    
                                   
                                    
                                        }
                                        
                                     
                                        Spacer()
                                            .frame(height: 15)
                                        
                                        HStack {
                                            
                                            
                                            
                                            // ***************************** Pic of the Day ********** After Aug 22 subit to Apple ******
                                            ZStack {
                                                
//                                                Image(systemName: "heart.fill")
//                                                    .resizable()
//                                                    .foregroundColor(Color.orange)
//                                                    .frame(width: 80, height: 60)
//                                                    .rotationEffect(.degrees(-7))
//                                                    .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                    .opacity(0.7)
//
//
//                                                NavigationLink( destination: PhotoPopFGPreload(user: user, friend: user, friends: friends, groups: groups),
//                                                                label: {
//                                                    Text("Meetup \nCoupon")
//                                                        .fontWeight(.light)
//                                                        .foregroundColor(Color.black)
//                                                        .font(.system(size: 10))
//                                                        .rotationEffect(.degrees(-7))
//                                                        .opacity(1.0)
//
//
//                                                })
                                            }
                                            
                                            Spacer ()
                                                .frame(width: 50)
                                           

                                            Spacer ()
                                                .frame(width: 50)
                                            
                                            //
                                            ZStack {
//
//                                                Image(systemName: "heart.fill")
//                                                    .resizable()
//                                                    .foregroundColor(Color.blue)
//                                                    .frame(width: 80, height: 60)
//                                                    .rotationEffect(.degrees(7))
//                                                    .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                    .opacity(0.6)
//
//
//                                                NavigationLink( destination: CH15(user: user, friends: friends),
//                                                                label: {
//                                                    Text("Hurt \nFeelings")
//                                                        .fontWeight(.light)
//                                                        .foregroundColor(Color.black)
//                                                        .font(.system(size: 10))
//                                                        .rotationEffect(.degrees(7))
//                                                        .opacity(0.85)
//
//                                                })
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                        
                        //************************************************ Accessorizing Section **************
                
                        
                        Spacer()
                            .frame(height: 25)
                        
                        HStack {
                            
                            VStack {
                                
                                ZStack {
                                    
                                    
                                    NavigationLink( destination:  RR17(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                                                    label: {
                                        Text("Leaving \nSafe-zone")
                                            .fontWeight(.bold)
                                            .frame(width: 300, height: 42)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16))
                                            .background(Color.orange)
                                            .glow(color: ColorManager.purple1, radius: 1)
                                            .shadow(color: .white, radius: 3, x: -4, y: 4)
                                            .opacity(0.75)
                                            .cornerRadius(15)
                                            .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                            .opacity(0.99)
                                    })
                                    
                                    
                                    HStack {
                                        ZStack {
                                            
                                            Image(systemName: "heart.fill")
                                                .resizable()
                                                .foregroundColor(ColorManager.orange3)
                                                .frame(width: 80, height: 60)
                                                .rotationEffect(.degrees(-7))
                                                .shadow(color: .white, radius: 2, x: -2, y: 2)
                                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                                .opacity(0.6)
                                            
                                            
                                            Link(destination: URL(string: "https://socialtechlabs.com/social-media-influencers/")!) {
                                                
                                                Text("supportive \ninfluencers")
                                                    .fontWeight(.light)
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 11))
                                                    .rotationEffect(.degrees(-7))
                                                    .opacity(0.85)
                                                
                                            }
                                        }
                                      
                                        Spacer ()
                                            .frame(width: 130)
                                        
                //                        ****************************************************************
                                        ZStack {
                                            
                                            Image(systemName: "heart.fill")
                                                .resizable()
                                                .foregroundColor(ColorManager.orange3)
                                                .frame(width: 80, height: 60)
                                                .rotationEffect(.degrees(7))
                                                .shadow(color: .white, radius: 2, x: -2, y: 2)
                                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                                .opacity(0.6)
                                            
                                            
                                            NavigationLink( destination: CH20(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                                                            label: {
                                                Text("Accessorizing")
                                                    .fontWeight(.light)
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 9))
                                                    .rotationEffect(.degrees(7))
                                                    .opacity(0.85)
                                                
                                            })
                                            
                                        }
                                        
                                        
//                                        Spacer ()
//                                            .frame(width: 180)
                                        
                                    }
                                }
                                
                                Spacer ()
                                    .frame(width: 400)
                                
                            }
                        }
                        
//    ************************************************
//                        ZStack {
//
//                            Image(systemName: "circle")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 60, height: 60)
//                                .foregroundColor(Color .green)
//                                .glow(color: ColorManager.purple4, radius: 20)
////                                    .blinking(duration: 2.0)
//
//
//                            NavigationLink( destination:  Step4_NuclearOption(user: user, friends: friends, groups: groups, atmosphere: atmosphere, friendAtmospheres: friendAtmospheres),
//                                            label: {
//                                Text("Fix \nFight")
//                                    .fontWeight(.medium)
//                                    .frame(width: 60, height: 60)
//                                    .foregroundColor(Color.white)
//                                    .font(.system(size: 10))
//                                    .blinking(duration: 4.0)
//
//                            })
//
//                        }
//    //    ************************************************
                        
//                        ZStack {
//                                        Image(systemName: "cube")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 70, height: 70)
//                                            .foregroundColor(Color.green)
//                                            .rotationEffect(.degrees(180))
//                                            .opacity(0.6)
//                                            .blinking(duration: 2.0)
//                                            .glow(color: ColorManager.purple4, radius: 20)
//
//
//         *****************************************************************
//                                        NavigationLink(
//                                            destination:  RR23(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                            label: {
//
//                                                Text("Beta")
//                                                    .fontWeight(.regular)
//                                                    .frame(width: 60, height: 60)
//                                                    .foregroundColor(Color.white)
//                                                    .font(.system(size: 15))
//                                                    .blinking(duration: 2.0)
//                                            }
//                                                )}
//
//                        ZStack {
//
//                            Image(systemName: "heart.fill")
//                                .resizable()
//                                .foregroundColor(Color.cyan)
//                                .frame(width: 150, height: 110)
//                                .rotationEffect(.degrees(7))
//                                .shadow(color: Color .blue, radius: 10, x: 10, y: 10)
//                                .opacity(0.5)
////                                        .blinking(duration: 2.0)
//
//
//                            NavigationLink(destination: RR31(user: user, friends: friends), label: {
//
//                                Text("We're here \nfor you")
//                                    .fontWeight(.thin)
//                                    .foregroundColor(Color.white)
//                                    .font(.system(size: 20))
//                                    .multilineTextAlignment(.center)
//                                    .rotationEffect(.degrees(7))
//                                    .opacity(1.0)
////                                            .blinking(duration: 2.0)
//
//
//                            }
//                            )}
//
                        
                        
                        Spacer ()
                            .frame(height: 100)
                        
                        //      *********************** My Crushes ************************************************
                        
//                        HStack {
//
//                            VStack {
//
//                                ZStack {
//
//
//                                    NavigationLink( destination:  RR17(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                                    label: {
//                                        Text("Features \nin Beta")
//                                            .fontWeight(.bold)
//                                            .frame(width: 300, height: 42)
//                                            .foregroundColor(Color.black)
//                                            .font(.system(size: 16))
//                                            .background(ColorManager .grey3)
//                                            .glow(color: ColorManager.purple1, radius: 1)
//                                            .shadow(color: .white, radius: 3, x: -4, y: 4)
//                                            .opacity(0.75)
//                                            .cornerRadius(15)
//                                            .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                            .opacity(0.6)
//                                    })
//
//
//                                    HStack {
//                                        ZStack {
//
//                                            Image(systemName: "square.fill")
//                                                .resizable()
//                                                .foregroundColor(ColorManager .grey4)
//                                                .frame(width: 60, height: 40)
//                                                .rotationEffect(.degrees(-7))
//                                                .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                .opacity(0.6)
//
//
//                                            NavigationLink( destination: RR18(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                                            label: {
//                                                Text("Love \nTarts")
//                                                    .fontWeight(.light)
//                                                    .foregroundColor(Color.white)
//                                                    .font(.system(size: 11))
//                                                    .rotationEffect(.degrees(-7))
//                                                    .opacity(0.85)
//
//                                            })
//                                        }
//
//                                        Spacer ()
//                                            .frame(width: 130)
//
//                //                        ****************************************************************
//                                        ZStack {
//
//                                            Image(systemName: "square.fill")
//                                                .resizable()
//                                                .foregroundColor(ColorManager .grey3)
//                                                .frame(width: 60, height: 40)
//                                                .rotationEffect(.degrees(7))
//                                                .shadow(color: .white, radius: 2, x: -2, y: 2)
//                                                .shadow(color: Color.white, radius: 2, x: 0, y: 2)
//                                                .opacity(0.6)
//
//
//                                            NavigationLink( destination: DreamVaultView(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                                            label: {
//                                                Text("My \nDreams")
//                                                    .fontWeight(.light)
//                                                    .foregroundColor(Color.white)
//                                                    .font(.system(size: 11))
//                                                    .rotationEffect(.degrees(7))
//                                                    .opacity(0.85)
//
//                                            })
//
//                                        }
//
//
////                                        Spacer ()
////                                            .frame(width: 180)
//
//                                    }
//                                }
//
//                                Spacer ()
//                                    .frame(width: 400)
//
//                            }
//                        }
//
//
//
                        
                        
                        
                        
                        //      *********************** My Crushes ************************************************
                        
                        //
                        //
                        //                    HStack {
                        //
                        //                        VStack {
                        //
                        //                            ZStack {
                        //
                        //
                        //
                        //                                Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe53lOWm49a8bLvHabb2d7QKAqQf4teai4hTHJSEAT-FtspXw/viewform")!) {
                        //
                        //                                    Text("Do you want a \n'My Crush' feature")
                        //                                        .fontWeight(.bold)
                        //                                        .frame(width: 300, height: 42)
                        //                                        .foregroundColor(Color.black)
                        //                                        .font(.system(size: 16))
                        //                                        .background(Color.purple)
                        //                                        .glow(color: ColorManager.purple1, radius: 1)
                        //                                        .shadow(color: .white, radius: 3, x: -4, y: 4)
                        //                                        .opacity(0.75)
                        //                                        .cornerRadius(15)
                        //                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                        //                                }
                        //
                        //                                HStack {
                        //
                        //                                    Image(systemName: "")
                        //                                        .resizable()
                        //                                        .scaledToFit()
                        //                                        .frame(width: 37, height: 37)
                        //                                        .opacity(0.5)
                        //                                        .foregroundColor(.black)
                        //                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                        //
                        //                                    Spacer ()
                        //                                        .frame(width: 180)
                        //
                        //                                    ZStack {
                        //
                        //                                        Image(systemName: "heart.fill")
                        //                                            .resizable()
                        //                                            .foregroundColor(ColorManager .grey3)
                        //                                            .frame(width: 85, height: 65)
                        //                                            .rotationEffect(.degrees(7))
                        //                                            .shadow(color: .white, radius: 2, x: -2, y: 2)
                        //                                            .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                        //                                            .opacity(0.99)
                        //
                        //
                        //                                        Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe53lOWm49a8bLvHabb2d7QKAqQf4teai4hTHJSEAT-FtspXw/viewform")!) {
                        //
                        //                                            Text("3 min \nsurvey")
                        //                                                .fontWeight(.light)
                        //                                                .foregroundColor(Color.black)
                        //                                                .font(.system(size: 11))
                        //                                                .rotationEffect(.degrees(7))
                        //                                                .opacity(0.85)
                        //
                        //                                        }
                        //                                    }
                        //                                }
                        //                            }
                        //                        }
                        //                    }
                        //
                        //                    VStack {
                        //
                        //                        NavigationLink(
                        //
                        //                            destination: BuiltByTeensView(user: user, friends: friends),
                        //                            label: {
                        //                                Text("our story")
                        //                                    .fontWeight(.regular)
                        //                                    .frame(width: 80, height: 20)
                        //                                    .foregroundColor(Color.white)
                        //                                    .font(.system(size: 13))
                        //                                    .background(Color.orange)
                        //                                    .cornerRadius(15)
                        //                                    .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                        //
                        //                            })
                        //
                        //                    }
                        //                    Spacer()
                        //                        .frame(width: 170)
                        //
                        //
                        //
                        //      old section ************************************************
                        
                        //      Old section ************************************************
                        
                        VStack {
                            
                            ZStack {
                                //
                                //                            NavigationLink(
                                //                                destination:  JournalsView(friends: friends),
                                //                                label: {
                                //
                                //                                    Image("thinCrush")
                                //                                        .resizable()
                                //                                        .frame(width: 320, height: 170)
                                //                                        .cornerRadius(20)
                                //                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                //                                })
                                VStack {
                                    
                                    VStack {
                                        
                                        //
                                        //
                                        //                                    Text("Sneak-peak NEW Features")
                                        //                                        .fontWeight(.bold)
                                        //                                        .frame(width: 280, height: 30)
                                        //                                        .foregroundColor(Color.black)
                                        //                                        .font(.system(size: 16))
                                        //                                        .background(Color.white)
                                        //                                        .cornerRadius(10)
                                        //                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                        ////
                                        ////
                                        //                                    Spacer()
                                        //                                        .frame(height: 10)
                                        //
                                        HStack {
                                            
                                            VStack {
                                                
                                                //
                                                //
                                                //                                            NavigationLink( destination: RR8(),
                                                //                                                            label: {
                                                //                                                Text("My Crush")
                                                //                                                    .fontWeight(.regular)
                                                //                                                    .frame(width: 120, height: 55)
                                                //                                                    .foregroundColor(ColorManager .grey4)
                                                //                                                    .font(.system(size: 15))
                                                //
                                                //                                            })
                                                //
                                            }
                                            //
                                            //                                        Spacer()
                                            //                                            .frame(width: 37)
                                            //
                                            //                                        VStack {
                                            //
//                                                                                        NavigationLink( destination: DreamVaultView(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
//                                                                                                        label: {
                                            //                                                Text("My Dreams")
                                            //                                                    .fontWeight(.regular)
                                            //                                                    .frame(width: 120, height: 55)
                                            //                                                    .foregroundColor(ColorManager .purple5)
                                            //                                                    .font(.system(size: 15))
                                            //
                                            //                                            })
                                            //
                                            
                                            
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    private struct MyRoomRowView: View {
        let title, imageName: String
        let backgroundColor, foregroundColor: CGColor
        
        var body: some View {
            ZStack {
                Color(cgColor: backgroundColor)
                
                HStack{
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .foregroundColor(Color(cgColor: foregroundColor))
                    
                    
                    
                    Spacer().frame(width: 20)
                    
                    Text(title)
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color(cgColor: foregroundColor))
                }
            }
            .frame(width: 310, height: 60)
            .opacity(0.6)
            .cornerRadius(15)
            .padding()
        }
    }
    
}

