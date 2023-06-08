//
//  Planet.swift
//  BestFriends
//
//  Created by Alex Titov on 3/31/22.
//

import SwiftUI

struct Planet: View {
    
    let user: User
    let atmosphere: Atmosphere
    
    @State private var online = false
    @State private var streak = 0
    
    var body: some View {
        ZStack {
            VStack {
                if online {
                    PlanetView(planet: atmosphere.planet, mood: atmosphere.mood)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .glow(color: glowColor())
                        .onAppear(perform: {print("Mood: ", atmosphere.mood)})
                    
                    
                    Text(user.firstName + " " + String(user.lastName.first!))
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.ultraLight)
                } else {
                    PlanetView(planet: atmosphere.planet, mood: atmosphere.mood)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .onAppear(perform: {print("Mood: ", atmosphere.mood)})
                    
                    
                    Text(user.firstName + " " + String(user.lastName.first!))
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.ultraLight)
                }
            }
            .onAppear(perform: loadData)
            
            if (streak > 0) {
                ZStack {
                    Text(String(streak))
                        .foregroundColor(.white)
                }
                .offset(x: 30, y: -30)
            }
        }
    }
    
    private func glowColor() -> Color {
        switch atmosphere.mood {
        case 0:
            return Color .cyan
        case 1:
            return Color .cyan
        case 2:
            return Color .cyan
        case 3:
            return Color .cyan
        case 4:
            return Color .purple
        case 5:
            return Color .green
        case 6:
            return Color .green
        case 7:
            return Color .green
        case 8:
            return Color.yellow
        case 9:
            return Color.yellow
        default:
            return ColorManager.pmbc_blue
        }
    }
    
    private func loadData() {
        RestApi.instance.getUserOnlineStatus(id: user.id).then({ response in
            online = response
        })
        RestApi.instance.getStreakLog(friendID: user.id).then({ response in
            streak = response
        })
    }
}

struct PlanetView: View {
    let planet: Int
    let mood: Int
    
    var body: some View {
        Image("planet_\(planet)")
            .resizable()
    }
}

struct PlanetActionsView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State private var showingAlert = false
    
    let user: User
    let atmosphere: Atmosphere
    let friends: [User]
    let friendAtmospheres: [Atmosphere]
    let groups: [Group]
    
    var body: some View {
        
        VStack {
            
            //            HStack {
            //                Image("home-alt2")
            //                    .frame(width: 50, height: 25)
            //                    .foregroundColor(.white)
            //                    .font(.system(size: 20))
            //                    .background(Color .black)
            //                    .cornerRadius(15)
            //                    .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
            //                    .opacity(0.70)
            //
            //
            //
            //
            //            }
            
            //            NavigationLink(
            //                destination: InfoWhyLoveFB(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
            //                label: {
            //                    Text("Start Here")
            //                    //                    Image("Start Here")
            //                        .frame(width: 120, height: 25)
            //
            //                        .foregroundColor(.green)
            //                        .font(.system(size: 23))
            //                        .background(Color .black)
            //                        .cornerRadius(15)
            //                        .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
            //                        .opacity(0.70)
            //                })
            //
            
            
            
            Spacer()
                .frame(height: 20)
            
            
            
            HStack {
                
                
                HStack {
                    
                    
                    VStack {
                        
                        NavigationLink(destination: Apologies(user: user, friends: friends),
                                       label: {
                            ZStack {
                                Circle()
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(ColorManager.purple4)
                                    .shadow(color: .white, radius: 3, x: 4, y: 4)
                                    .glow(color: ColorManager.purple4, radius: 7)
                                    .opacity(0.80)
                                
                                
                                ZStack {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(ColorManager .grey3)
                                        .frame(width: 90, height: 70)
                                        .opacity(0.95)
                                    
                                    Text("Thank \nyou!")
                                        .fontWeight(.light)
                                    //                                        .frame(width: 100, height: 40)
                                        .foregroundColor(ColorManager .grey1)
                                        .font(.system(size: 17))
                                        .background(ColorManager .grey3)
                                        .cornerRadius(10)
                                    
                                }
                                
                                VStack {
                                    
                                    Image("")
                                    
                                    
                                    
                                }
                            }
                            
                        })
                        
                        
                        
                        Spacer()
                            .frame(height: 35)
                        
                        //                        TestPage2(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups)
                        //
                        //
                        //                        MyRoomInfo(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups
                        
                        //                        HugPreload(user: user, friends: friends, groups: groups, atmosphere: atmosphere)
                        
                        NavigationLink(destination:  TestPage2(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups), label: {
                            ZStack {
                                Circle()
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(ColorManager.purple2)
                                    .shadow(color: .white, radius: 3, x: 4, y: -4)
                                    .glow(color: ColorManager.purple4, radius: 7)
                                    .opacity(0.80)
                                
                                VStack {
                                    
                                    Text("Bad Day \nQuiet Alert")
                                        .foregroundColor(ColorManager .purple3)
                                        .font(.system(size: 20, weight: .regular))
                                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                                        .opacity(0.50)
                                    
                                    //                                    Image("IconRoomNew")
                                }
                            }
                            
                            
                        }
                        )}
                    
                    
                    
                    //                    ************************************************
                    
                    
                    
                    VStack {
                        
                        
                        
                        
                        Spacer()
                            .frame(height: 15)
                        
                        
                        
                        NavigationLink(destination:  EmptyView(),
                                       label: {
                            ZStack {
                                Circle()
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(ColorManager.purple2)
                                    .shadow(color: .white, radius: 3, x: 0, y: 4)
                                    .glow(color: ColorManager.purple4, radius: 7)
                                    .opacity(0.80)
                                
                                VStack {
                                    ZStack {
                                        //
                                        //                          NavigationLink(destination: HorizonPromoPage(user: user, friends: friends, atmosphere: atmosphere),
                                        //                                        LINK ^^^ TO THE JOURNAL INTRO PAGE **************
                                        
//                                        NEWSFeedPergion(user: user, friends: friends, atmosphere: atmosphere
                                        
                                        
                                        NavigationLink(destination: NEWSFeedPergion(user: user, friends: friends, atmosphere: atmosphere),
                                                       label: {
                                            VStack {
                                                //
                                                Text("Friendships")
                                                    .foregroundColor(ColorManager .purple3)
                                                    .font(.system(size: 20, weight: .regular))
                                                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                                                    .opacity(0.50)
                                                
                                            }
                                        })
                                    }
                                    
                                    
                                }
                            }
                        })
                        
                        
                        
                        Spacer()
                            .frame(height: 25)
                        
                        
                        
                        
                        //                        HugPreload(user: user, friends: friends, groups: groups, atmosphere: atmosphere
                        
                        //                        HugPreload(user: user, friends: friends, groups: groups, atmosphere: atmosphere
                        
                        NavigationLink(destination: HugPushNotification2(user: user, atmosphere: atmosphere, friends: friends, groups: groups),
                                       label: {
                            ZStack {
                                Circle()
                                    .frame(width: 140, height: 140)
                                    .foregroundColor(ColorManager.purple2)
                                    .shadow(color: .white, radius: 17, x: 0, y: 0)
                                    .shadow(color: .white, radius: 20, x: 0, y: 0)
                                    .glow(color: ColorManager.purple4, radius: 3)
                                    .opacity(0.5)
                                
                                VStack {
                                    
                                    
                                    
                                    Spacer()
                                        .frame(height: 0)
                                    
                                    
                                    Text("send")
                                        .foregroundColor(ColorManager .pmbc_green)
                                    //                                        .italic()
                                        .font(.system(size: 17, weight: .light))
                                    //                                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                                    //                                        .opacity(0.90)
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    
                                    Text("Care Hearts")
                                        .foregroundColor(.white)
                                        .font(.system(size: 25, weight: .bold))
                                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                                        .opacity(0.50)
                                    
                                    
                                    Spacer()
                                        .frame(height: 20)
                                    
                                }
                            }
                        })
                        
                        
                        Spacer()
                            .frame(height: 25)
                        //                        Apologies(user: user, friends: friends\
                        
                        //                        TestPage(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups)
                        
                        //                        BuiltForTeens(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups
                        
                        NavigationLink(destination: MyRoomInfo(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                                       label: {
                            
                            
                            ZStack {
                                Circle()
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(ColorManager.purple2)
                                    .shadow(color: .white, radius: 3, x: 0, y: -4)
                                    .glow(color: ColorManager.purple4, radius: 7)
                                    .opacity(0.80)
                                
                                VStack {
                                    //                                    Image("NiceIconNew2")
                                    
                                    
                                    
                                    Text("My \nRoom")
                                        .foregroundColor(ColorManager .purple3)
                                        .font(.system(size: 19, weight: .regular))
                                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                                        .opacity(0.50)
                                    
                                    
                                }
                            }
                        })
                    }
                    
                    
                    VStack {
                        
                        
                        NavigationLink(destination: SaySomethingNice6(user: user, atmosphere: atmosphere, friends: friends, groups: groups, friendAtmospheres: friendAtmospheres),
                                       label: {
                            ZStack {
                                Circle()
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(ColorManager .pmbc_green)
                                    .shadow(color: .white, radius: 3, x: -4, y: 4)
                                    .glow(color: ColorManager.purple4, radius: 7)
                                    .opacity(0.80)
                                
                                
                                ZStack {
                                    //                                    Image(systemName: "heart.fill")
                                    //                                        .resizable()
                                    //                                        .foregroundColor(ColorManager .orange4)
                                    //                                        .frame(width: 90, height: 70)
                                    //                                        .opacity(0.95)
                                    
                                    VStack {
                                        
                                        Text("new user")
                                            .foregroundColor(ColorManager .purple1)
                                            .font(.system(size: 22, weight: .regular))
                                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                                            .opacity(0.50)
                                        
                                        Text("START")
                                            .foregroundColor(ColorManager .purple1)
                                            .font(.system(size: 25, weight: .regular))
                                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                                            .opacity(0.50)
                                        
                                        Text("here")
                                            .foregroundColor(ColorManager .purple1)
                                            .font(.system(size: 22, weight: .regular))
                                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                                            .opacity(0.50)                                     .cornerRadius(10)
                                    }
                                }
                                VStack {
                                    
                                    Image("")
                                    
                                    
                                    
                                }
                            }
                            
                        })
                        
                        
                        
                        Spacer()
                            .frame(height: 35)
                        
                        //                        TestPage3(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups
                        
                        
                        
//                        PickMediator is for Dream section
                        
//                        PickMediator(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups
//
                        
                        
                        NavigationLink(destination: AtmosphereInfo(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                                       label: {
                            
                            ZStack {
                                Circle()
                                //
                                
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(ColorManager.purple2)
                                    .shadow(color: .white, radius: 3, x: -4, y: -4)
                                    .glow(color: ColorManager.purple4, radius: 7)
                                    .opacity(0.80)
                                
                                VStack {
                                    Text("Journal \nVibe \nTracker")
                                        .foregroundColor(ColorManager .purple3)
                                        .font(.system(size: 20, weight: .regular))
                                        .shadow(color: .black, radius: 1, x: 0, y: 1)
                                        .opacity(0.50)
                                    
                                    //                                    Image("iconStar 1")
                                    
                                }
                            }
                        })
                    }
                    
                }
                
            }
            
        }
        
    }
    
}