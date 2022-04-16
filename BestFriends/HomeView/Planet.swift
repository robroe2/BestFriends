//
//  Planet.swift
//  BestFriends
//
//  Created by Alex Titov on 3/31/22.
//

import SwiftUI

struct Planet: View {
    
    let user: User
    
    var planet: Int
    var mood: Int

    var body: some View {
        PlanetView(planet: planet, mood: mood)
            .scaledToFit()
            .frame(width: 120, height: 120)
            .glow(color: glowColor())
    }
    
    private func glowColor() -> Color {
        switch mood {
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
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_green)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("Atmosphere")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                    }
                }
                
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_blue)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("Smile\nVault")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                    }
                }
                
            }
            
            VStack {
                Button(action: {
                    sessionManager.showInvite()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_blue)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("Add\nFriends")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                    }
                    
                }
                
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_pink)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("Customize\nPlanet")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                    }
                }
                
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    sessionManager.showFreindVaultView()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_green)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("User\nVault")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                  
                    
                    }
                }
                
            }
            
            VStack {
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_green)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("Daily\nHorizon")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                    }
                }
                
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(ColorManager.pmbc_blue)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Text("Photo\nPop")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .shadow(color: .black, radius: 1, x: 0, y: 1)
                    }
                }
                
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetActionsView()
    }
}
