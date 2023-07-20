//
//  CH11.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/17/23.
//

//import SwiftUI
//
//struct CH11: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct CH11_Previews: PreviewProvider {
//    static var previews: some View {
//        CH11()
//    }
//}


import Foundation
import SwiftUI

struct CH11: View {
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
          
   Image("FHBackground")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            

                
                VStack {

                    Text("Friendships")
                        .font(.system(size: 35))
                        .foregroundColor(ColorManager .grey1)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                    
//                    Text("")
//                        .font(.system(size: 45))
//                        .foregroundColor(ColorManager .grey1)
//                        .fontWeight(.thin)
//                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        
                        Spacer()
                            .frame(height: 70)
                        
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: 375, height: 375)
                            .shadow(color: ColorManager .purple2, radius: 65, x: 30, y: 50)
                            .opacity(0.4)
                        VStack {
                            
                            
                            Spacer()
                                .frame(height: 70)
                            
                            Text("Redeem a \n'Frendship Coupon.")
                                .font(.system(size: 27))
                                .foregroundColor(ColorManager .grey1)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                            
                            
                            Spacer()
                                .frame(height: 90)
                            

                            
                        }
                        
                    }

                        }
                        
                    }
                    
                }
                
            }
        

