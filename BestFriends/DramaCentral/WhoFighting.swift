//
//  WhoFighting.swift
//  BestFriends
//
//  Created by Social Tech on 5/3/22.
//

import Foundation

import Foundation
import SwiftUI

struct WhoFighting: View {
    
    @State private var showItems: Bool = false
    @State private var offset: CGFloat = 200.0
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.9301232696, green: 0.9072448611, blue: 0.9865264297, alpha: 1))
                .ignoresSafeArea()

            Image("purpleBackground")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
           
            AdPlayerView(name: "backgroundAnimation")
                .ignoresSafeArea()
                .blendMode(.screen)
//                .offset(y: -250)
            
            
//            Image("planet_4")
        
        ZStack {

            NavigationLink(destination: FightWithFriend(), label: {
                WhoFightingCircle (color: .pink, friendName: "Huge Fight \nwith my \nBFF")
                })
            .offset(x: showItems ? 100 : 0, y: showItems ? -325: 0)
             
     
           
              NavigationLink(destination: ParentsFighting(), label: {
                  WhoFightingCircle (color: .orange, friendName: "OMG, my Parents \nAGAIN!")
            })
            .offset(x: showItems ? 75 : 0, y: showItems ? 150: 0)
            

            NavigationLink(destination: FightWithFriend(), label: { WhoFightingCircle (color: .blue, friendName: "My \nFriend \nGroup")
            })
            .offset(x: showItems ? -100 : 0, y: showItems ? -170: 0)
            


        Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 250, height: 250)
                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 10, x: 10, y: 10)

        VStack {
                

            Text("Enter")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                  
                Text("BlueMode")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                    
                    
                    Text("Who's \nF I G H T I N G?")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                    
                }
            }
            
            
           .onTapGesture {
               withAnimation {
               self.showItems.toggle()
               }
               print("tap function is working")
           }
            
           .animation(Animation.easeInOut(duration: 1.0), value: showItems)

            }
        }
    }
   

struct WhoFightingCircle: View {
    var color: Color
    var friendName: String
    
    var body: some View {
       
        ZStack {
          
        Rectangle()
        .frame(width: 150, height: 150)
        .clipShape(Circle())
        .foregroundColor(color)

        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 5, x: 0, y: 5)
        
        Text(friendName)
                .fontWeight(.light)
                .foregroundColor(.black)
//
//            Spacer()
//                  .frame(height: 200)
//
        }
    }
}


struct WhoFighting_Previews : PreviewProvider {
    static var previews: some View {
        WhoFighting()
    }

}
