//
//  TryThis.swift
//  BestFriends
//
//  Created by Social Tech on 4/28/22.
//

import Foundation
import SwiftUI
import Promises
//import AVKit


struct TryThis: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    @State private var homeData: HomeData?
    init() {
        print("is this working")
          getHomeData()
       }
    var body: some View {
       
//        NavigationView {
            
            ZStack {
                
                ColorManager.grey2
                      .ignoresSafeArea()
//                Image("blueBackground")
//                    .resizable()
//                    .ignoresSafeArea()
//                    .scaledToFill()
                
                    .onAppear{
                        print("is this working")
                        getHomeData()
//
//                AdPlayerView(name: "face")
//                    .ignoresSafeArea()
//                    .blendMode(.screen)
//
                    
                    
                    }
         
                VStack {
                    Text("While counting the hours")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 0)
                    
                    
                    Text("waiting on an")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 0)
                    Spacer()
                        .frame(height: 20)
                    
                    Text("ANSWER BACK")
                        .font(.system(size: 45))
                        .foregroundColor(.blue)
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 0)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("*listen to your favorite songs \n*take a walk \n*watch a funny video \n*watch a movie \n*hangout with friends in Chat")
                        .font(.system(size: 17))
                        .italic()
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)

                    Spacer()
                        .frame(height: 30)
                    
                    VStack {
                        

                        Spacer()
                            .frame(height:20)

                        
                      
                        Spacer()
                            .frame(height: 130)
                }
            }
                    
            }.onAppear{
                getHomeData()
            }
    }
    private func getHomeData() {
        RestApi.instance.getHomeData().then{ data in
            print("Got HomeData: ", data)
            homeData = data
        }.catch { err in
            print("Got error")
            print(err)
        }
        
    }
        
}

