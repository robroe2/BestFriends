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
    
    var body: some View {
        VStack {
            PlanetView(planet: atmosphere.planet, mood: atmosphere.mood)
                .scaledToFit()
                .frame(width: 65, height: 65)
                .glow(color: glowColor())
            
            
            Text(user.firstName + " " + String(user.lastName.first!))
                .foregroundColor(.white)
                .fontWeight(.thin)
        }
    }
    
    private func glowColor() -> Color {
        switch atmosphere.mood {
        case 0:
            return ColorManager.pmbc_blue
        case 1:
            return ColorManager.pmbc_green
        case 2:
            return ColorManager.pmbc_pink
        default:
            return ColorManager.pmbc_blue
        }
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
    
    let user: User
    let atmosphere: Atmosphere
    
    let friends: [User]
    let friendAtmospheres: [Atmosphere]
    
    var body: some View {
        HStack {
            VStack {
                NavigationLink(destination: BestFriendMessages(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres),
                               label: {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.purple2)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        VStack {
                            Text("'LOOK' \nMy Friends \nLike Me")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                })
                
                Spacer()
                    .frame(height: 40)
                
                NavigationLink(destination: WhoFighting(),
                               label: {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
//                            .foregroundColor(ColorManager.red)
                            .foregroundColor(.pink)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        VStack {
                            
                            
                            Text("Huge \nFight")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                }
                )}
            
            VStack {
                Button(action: {
                    sessionManager.showInvite()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_green)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        VStack {
                            Text("+")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .regular))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                            Text("Friends")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                }
                
           
                Spacer()
                    .frame(height: 40)
                
                NavigationLink(destination: OurMission(),
                               label: {
                    ZStack {
                        Circle()
                            .frame(width: 120, height: 120)
                            .foregroundColor(ColorManager.grey1)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        VStack {
                            Text("Demo \nn'\nSettings")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                })
                
                Spacer()
                    .frame(height: 40)

                
                
//                here^^^
                
                Button(action: {
                    sessionManager.showMasterFriendVault()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.purple4)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        VStack {
                            Text("My")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                           
                            Text("Friends")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                }
            }
            
           VStack {
                NavigationLink(destination: AtmosphereMain2(user: User(id: "", firstName: "", lastName: "", APNToken: "", atmosphere: ""), friends: []),
                               label: {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.purple2)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        VStack {
                            Text("My \nAtmosphere")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                })
            
            
            Spacer()
                    .frame(height: 40)
                
     
                NavigationLink(destination: BestFriendMessages(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres),
                              label: {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.purple2)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        VStack {
                            Text("Shared \nHorizons")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .shadow(color: .black, radius: 1, x: 0, y: 1)
                        }
                    }
                })
            }
        }
    }
}




//
//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetActionsView()
// }
//}
