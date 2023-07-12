//
//  FH5.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/7/23.
//


import Foundation
import SwiftUI

struct FH5: View {
    @EnvironmentObject var sessionManager: SessionManager
    
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
                .ignoresSafeArea()
            
            AdPlayerView(name: "Galaxy2")
                .ignoresSafeArea()
                .blendMode(.screen)
                .opacity(0.7)
            
//            if shareTapped {
//
//                ColorManager.grey4
//                    .opacity(0.8)
//                    .ignoresSafeArea()
//
//                AdPlayerView(name: "dramaLights")
//                    .ignoresSafeArea()
//                    .blendMode(.screen)
//
//            } else {
//
//                Image("FHBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
                
                //                ScrollView {
                
                VStack {

                    Text("Drama Days")
                        .font(.system(size: 35))
                        .foregroundColor(ColorManager .grey1)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.center)
                    
//                    Text("PhotoPOP")
//                        .font(.system(size: 45))
//                        .foregroundColor(ColorManager .grey1)
//                        .fontWeight(.thin)
//                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        
                        Spacer()
                            .frame(height: 50)
                        
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: 375, height: 375)
                            .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                            .opacity(0.4)
                        VStack {
                            
                            
                            Spacer()
                                .frame(height: 90)
                            
                            Text("That's Right: \n\nWe even let you know when \na friend is ready to talk \nafter a fight.")
                                .font(.system(size: 27))
                                .foregroundColor(ColorManager .grey1)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                            
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Image("girlwalking250")
                                .resizable()
                                .frame(width: 125, height: 125)
                            
                        }
                        
                    }
                        VStack {
                            
                            Spacer()
                                .frame(height: 30)
                           
                               
                          
                            NavigationLink(
                                destination: FH4(),
                                label: {
                                    Text("->")
                                        .fontWeight(.thin)
                                        .foregroundColor(Color.white)
                                        .frame(width: 40, height: 40)
                                        .font(.system(size: 30))
                                        .background(ColorManager .grey2)
                                        .opacity(0.95)
                                        .cornerRadius(5)
                                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                                }
                                
                            )}
                            
                            
                            
                            
                                Spacer()
                                    .frame(height: 40)

                        }
                        
                    }
                    
                }
                
            }
        