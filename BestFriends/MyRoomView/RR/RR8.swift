//
//  RR8.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/15/23.
//





import Foundation
import SwiftUI

struct RR8: View {
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
            
            ColorManager.grey4
                .opacity(0.99)
                .ignoresSafeArea()
            
            
            Image("Tswift2")
                .ignoresSafeArea()
                .scaledToFit()
                .opacity(0.6)
            
            AdPlayerView(name: "sky2")
                .ignoresSafeArea()
                .blendMode(.screen)
            
            //                ScrollView {
            
            VStack {
                
                //                    Text("Emotional Support")
                //                        .font(.system(size: 35))
                //                        .foregroundColor(ColorManager .grey1)
                //                        .fontWeight(.thin)
                //                        .multilineTextAlignment(.center)
                
                Text("My Crushes")
                    .font(.system(size: 45))
                    .foregroundColor(Color.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 10)
                
                Text("Help us build")
                    .font(.system(size: 27))
                    .foregroundColor(Color.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                
                Text("a unique Crush platform")
                    .font(.system(size: 27))
                    .foregroundColor(Color.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                
      
                
                ZStack {
                    
                    Spacer()
                        .frame(height: 70)
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.purple)
                        .frame(width: 375, height: 375)
                        .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                        .opacity(0.7)
                    VStack {
                        
                        
                        Spacer()
                            .frame(height: 40)
                        
                        Text("Be part of the fun!")
                            .font(.system(size: 25))
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                        
                     
                        VStack {

                            
    Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe53lOWm49a8bLvHabb2d7QKAqQf4teai4hTHJSEAT-FtspXw/viewform")!) {
        Text("3 min survey")
            .fontWeight(.thin)
            .frame(width: 200, height: 40)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .font(.system(size: 25))
            .background(ColorManager.pmbc_green)
            .cornerRadius(15)
            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                              
                            }
                        
    
                            
                        }
                            
                      
                            Spacer()
                                .frame(height: 40)
                            
                            Text("We'll build")
                                .font(.system(size: 30))
                                .italic()
                                .foregroundColor(Color.white)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            
                            
                            
                            Text("what you WANT!")
                            .italic()
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            
                            
                            
                            Spacer()
                                .frame(height: 50)
                            
                            
                            
                        }
                        
                    }
                    VStack {
                        
        
                        
                        
                        Spacer()
                            .frame(height: 40)
                        
                    }
                    
                }
                
            }
            
        }
        
    }

