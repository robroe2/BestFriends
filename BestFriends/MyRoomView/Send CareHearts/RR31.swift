//
//  RR31.swift
//  BestFriends
//
//  Created by Robert Roe on 9/30/23.
//



import Foundation
import SwiftUI
import ConfettiSwiftUI
import AVKit

struct RR31: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: User
    let friends: [User]
    
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
        
        ZStack {
            
            
            if shareTapped {
                
                
                
                ColorManager.grey4
                    .ignoresSafeArea()
                    .onAppear()
                //                Image("purpleBackground")
                //                    .resizable()
                //                    .ignoresSafeArea()
                //                    .scaledToFill()
                //                    .ignoresSafeArea()
                
                AdPlayerView(name: "dramaLights")
                    .ignoresSafeArea()
                    .blendMode(.screen)
            } else {
                
                
                Color.black
                    .opacity(0.9)
                    .ignoresSafeArea()
                
                AdPlayerView(name: "sky2")
                    .ignoresSafeArea()
                    .blendMode(.screen)
            }
            
            
            
            VStack{
                
                HStack {
                    VStack {
                        
                        //                        Text("give a")
                        //                            .font(.system(size: 35, weight: .ultraLight))
                        //                            .foregroundColor(ColorManager .purple2)
                        
                        
                        Text("CareHearts")
                            .font(.system(size: 35, weight: .ultraLight))
                            .foregroundColor(ColorManager .purple2)
                        
                        Text("your way!")
                            .font(.system(size: 35, weight: .ultraLight))
                            .foregroundColor(ColorManager .purple2)
                        
                    }
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.pink)
                        .glow(color: ColorManager.purple4, radius: 20)
                        .rotationEffect(.degrees(-7))
                }
                
                
                VStack {
                    
                    //                    Text("Jump up on a chair, then ...")
                    //                                            .font(.system(size: 25))
                    //
                    //                                            .foregroundColor(ColorManager .grey2)
                    //                                            .fontWeight(.thin)
                    //                                            .multilineTextAlignment(.center)
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 100)
                        
                        Text("Tell us what kind of CareHeart")
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                        
                        Text("you'd like to see")
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        
                        //                            Text("send us an email")
                        //                                .fontWeight(.thin)
                        //                                .italic()
                        //                                .foregroundColor(Color.white)
                        //                                .font(.system(size: 15))
                        //                                .multilineTextAlignment(.center)
                        //                                .rotationEffect(.degrees(7))
                        //                                .opacity(1.0)
                        
                        
                        Text("CareHeart@SocialTechLabs.com")
                            .fontWeight(.regular)
                            .italic()
                            .foregroundColor(Color.white)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(height: 25)
                        
                        Text("We'll beta test you idea")
                            .fontWeight(.thin)
                            .italic()
                            .foregroundColor(Color.white)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                        
                        Text("If it get 80% yes votes")
                            .fontWeight(.thin)
                            .italic()
                            .foregroundColor(Color.white)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                        
                        Text("we'll build it")
                            .fontWeight(.thin)
                            .italic()
                            .foregroundColor(Color.white)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                        
                        
                        
                        
                        //************************************************************************
                        
                        //************************************************************************
                        
                        //                        HStack {
                        //
                        //                                //                            Text("select >")
                        //                                //                                .fontWeight(.thin)
                        //                                //                                .frame(width: 100, height: 30)
                        //                                //                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        //                                //                                .font(.system(size: 20))
                        //                                //                                .background(Color(hue: 0.555, saturation: 1.0, brightness: 0.845))
                        //                                //                                .cornerRadius(25)
                        //                                //                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        //                                //                                })
                        //
                        //                                if friends.count > 0 {
                        //                                    RectView(user: user, friend: friends[0], color: colors[0])
                        //                                        .onTapGesture(perform: {
                        //                                            if selectedFriends.contains(friends[0].id) {
                        //                                                selectedFriends = selectedFriends.filter { $0 != friends[0].id }
                        //                                                colors[0] = ColorManager.purple3
                        //                                            } else {
                        //                                                selectedFriends.append(friends[0].id)
                        //                                                colors[0] = ColorManager.purple5
                        //                                            }
                        //                                            print(selectedFriends)
                        //                                        })
                        //
                        //                                }
                        //
                        //                                if friends.count > 1 {
                        //                                    RectView(user: user, friend: friends[1], color: colors[1])
                        //                                        .onTapGesture(perform: {
                        //                                            if selectedFriends.contains(friends[1].id) {
                        //                                                selectedFriends = selectedFriends.filter { $0 != friends[1].id }
                        //                                                colors[1] = ColorManager.purple3
                        //                                            } else {
                        //                                                selectedFriends.append(friends[1].id)
                        //                                                colors[1] = ColorManager.purple5
                        //                                            }
                        //                                            print(selectedFriends)
                        //                                        })
                        //
                        //                                }
                        //                            }
                        //
                        //                            Spacer()
                        //                                .frame(height: 15)
                        //                            HStack {
                        //                                if friends.count > 2 {
                        //                                    RectView(user: user, friend: friends[2], color: colors[2])
                        //                                        .onTapGesture(perform: {
                        //                                            if selectedFriends.contains(friends[2].id) {
                        //                                                selectedFriends = selectedFriends.filter { $0 != friends[2].id }
                        //                                                colors[2] = ColorManager.purple3
                        //                                            } else {
                        //                                                selectedFriends.append(friends[2].id)
                        //                                                colors[2] = ColorManager.purple5
                        //                                            }
                        //                                            print(selectedFriends)
                        //                                        })
                        //                                }
                        //
                        //                                if friends.count > 3 {
                        //                                    RectView(user: user, friend: friends[3], color: colors[3])
                        //                                        .onTapGesture(perform: {
                        //                                            if selectedFriends.contains(friends[3].id) {
                        //                                                selectedFriends = selectedFriends.filter { $0 != friends[3].id }
                        //                                                colors[3] = ColorManager.purple3
                        //                                            } else {
                        //                                                selectedFriends.append(friends[3].id)
                        //                                                colors[3] = ColorManager.purple5
                        //                                            }
                        //                                            print(selectedFriends)
                        //                                        })
                        //
                        //                                }
                        //
                        //                                if friends.count > 4 {
                        //                                    RectView(user: user, friend: friends[4], color: colors[4])
                        //                                        .onTapGesture(perform: {
                        //                                            if selectedFriends.contains(friends[4].id) {
                        //                                                selectedFriends = selectedFriends.filter { $0 != friends[4].id }
                        //                                                colors[4] = ColorManager.purple3
                        //                                            } else {
                        //                                                selectedFriends.append(friends[4].id)
                        //                                                colors[4] = ColorManager.purple5
                        //                                            }
                        //                                            print(selectedFriends)
                        //                                        })
                        //
                        //                                }
                        //                            }
                        //
                        //
                        //
                        //                            Spacer()
                        //                                .frame(height: 20)
                        //
                        //
                        //                            Button(action: {
                        //                                counter += 1
                        //                                shareTapped = true
                        //                                shareButtonTapped()
                        //                            },
                        //                                   label: {
                        //                                Text("SHARE")
                        //
                        //                                    .fontWeight(.thin)
                        //                                    .frame(width: 100, height: 30)
                        //                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        //                                    .font(.system(size: 25))
                        //                                    .background(shareColor)
                        //                                    .cornerRadius(25)
                        //                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        //                                    .alert("Nice!", isPresented: $showingAlert) {
                        //                                        Button("OK", role: .cancel) { }
                        //                                    }
                        //                            })
                        //                            .confettiCannon(counter: $counter)
                        //
                        //
                        //                            VStack {
                        //
                        //
                        //                                Button(action: {
                        //                                    sessionManager.showLogin()
                        //                                },
                        //                                       label: {
                        //                                    Image("home-alt2")
                        //                                        .frame(width: 50, height: 25)
                        //                                        .foregroundColor(.white)
                        //                                        .font(.system(size: 20))
                        //                                        .background(ColorManager .grey2)
                        //                                        .cornerRadius(15)
                        //                                        .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                        //                                        .opacity(0.70)
                    }
                    //                                })
                    //
                    //
                    //                                Spacer()
                    //                                    .frame(height: 30)
                    //
                    //                            }
                    //
                    //
                    //
                    //                        }
                    //
                    //
                    //
                    //
                    //                        Spacer()
                    //                            .frame(height: 100)
                    //
                    //                    }
                    //
                    //                }
                    //
                    //            }
                    //
                    //        }
                    //
                    //
                    //        func shareButtonTapped() {
                    //            if selectedFriends.count == 0 { return }
                    //            for id in selectedFriends {
                    //                for f in friends {
                    //                    if f.id == id {
                    //                        RestApi.instance.sendPushNotification(title: "BestFriends", body: "\(user.firstName) Sent a fist-pump", APNToken: f.APNToken)
                    //
                    //                        //MARK: The code below creates an in-app notification for your friend (f.id)
                    //                        //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
                    //                        RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "sent you a fist-pump", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
                    //                            print("Create a fist-pump notification response code: ", response)
                    //                        })
                    //
                    //                    }
                    //                }
                    //            }
                    //            shareColor = ColorManager.darkGrey
                    //            showingAlert = true
                    //        }
                    //
                    //        struct RectView: View {
                    //            let user: User
                    //            let friend: User
                    //            let color: Color
                    //
                    //            var body: some View {
                    //                Text(friend.firstName + " " + String(friend.lastName.first!))
                    //                    .fontWeight(.bold)
                    //                    .frame(width: 80, height: 80)
                    //                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    //                    .font(.system(size: 8))
                    //                    .background(color)
                    //                    .cornerRadius(75)
                    //                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                }
            }
            
            
        }
        
    }
}
