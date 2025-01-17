//
//  CH7.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/11/23.
//


import Foundation
import SwiftUI
import ConfettiSwiftUI
import AVKit
import Combine


struct CH7: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: User
    let friend: User
    let friends: [User]
    let groups: [Group]
    
    @State private var selectedFriends: [String] = []
    @State private var colors: [Color] = [ColorManager.grey2, ColorManager.grey2, ColorManager.grey2, ColorManager.grey2, ColorManager.grey2]
    @State private var shareColor = ColorManager.purple5
    @State private var showingAlert = false
    
    @State private var counter = 0
    
    @State private var mood: Int = -1
    @State private var summary = ""
    @State private var sharedWith: [String] = []
    @State private var colorChangeTap: String = ""
    @State private var shareTapped: Bool = false
    
    
    @State private var customMessage = ""


    private func limitText(_ upper: Int) {
        if customMessage.count > upper {
            customMessage = String(customMessage.prefix(upper))
        }
    }
    private func sendMessage() {
        if customMessage.count == 0 { return }

//        let arr = [user.id, friend.id]
        if selectedFriends.count == 0 {return}
        
        customMessage = "Thanks for Song from; " + user.firstName + " : " + customMessage;
        
        for friendID in selectedFriends {
            let arr = [user.id, friendID]
            var found = false;
            for g in groups {
                if g.members.containsSameElements(as: arr) {
                    // Send chat message to this existing group
                    RestApi.instance.createChatMessage(groupId: g.id, body: customMessage).then({ response in
                        sessionManager.showChat(user: user, group: g)
                    })
                    found = true;
                    break;
                }
            }
            
            // Create new group
            if found == false {
                for f in friends {
                    if f.id == friendID {
                        RestApi.instance.createGroup(name: "\(user.firstName), \(f.firstName)", members: arr).then { responseGroup in
                            // Send chat message to this group
                            RestApi.instance.createChatMessage(groupId: responseGroup.id, body: customMessage).then({ response in
                                                    sessionManager.showChat(user: user, group: responseGroup)
                            })
                        }
                    }
                }
            }
        }
    }

    
    var body: some View {
        
        ZStack {
          
            
                  if shareTapped {
                      
                      Color.black
                          .opacity(0.8)
                          .ignoresSafeArea()
              
                      AdPlayerView(name: "dramaLights")
                          .opacity(0.5)
                          .ignoresSafeArea()
                          .blendMode(.screen)

//                      AdPlayerView(name: "gotSong3")
//                          .opacity(0.5)
//                          .ignoresSafeArea()
//                          .blendMode(.screen)
                      
                      
                      AdPlayerView(name: "Coldplay2")
                          .opacity(0.5)
                          .ignoresSafeArea()
                          .blendMode(.screen)
                      
                  } else {

               
                      
                      ColorManager .grey2
                        .opacity(0.4)
                        .ignoresSafeArea()
                      
                      AdPlayerView(name: "sky2")
                          .ignoresSafeArea()
                          .blendMode(.screen)
             
                      AdPlayerView(name: "grayDots2")
                          .ignoresSafeArea()
                          .blendMode(.screen)
                          .opacity(0.9)
                      
                      
                    
            }
            

            
            VStack {
    
                VStack {
                    
                    Spacer()
                        .frame(height: 30)
                    
                    ZStack {
                        
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: 350, height: 350)
                            .shadow(color: ColorManager .purple3, radius: 65, x: 30, y: 50)
                            .opacity(0.5)
                        
                        VStack {
                            Text("Friend sent you a \ncheer-up Song \nin Chat")
                                .font(.system(size: 19, weight: .light))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            
                          
                   
                        }
                    }

                    Text("(check Chat for the name of the song)")
                                            .font(.system(size: 17))
                                            .italic()
                                            .foregroundColor(ColorManager .grey3)
                                            .fontWeight(.regular)
                                            .multilineTextAlignment(.center)
                    
                    
                    Text("(Shoot'm a thank you)")
                        .font(.system(size: 15))
                        .italic()
                        .fontWeight(.light)
                        .foregroundColor(ColorManager .grey3)
                        .multilineTextAlignment(.center)
               
            
                    VStack {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        
                        HStack {
                            
                            if friends.count > 0 {
                                RectView(user: user, friend: friends[0], color: colors[0])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[0].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[0].id }
                                            colors[0] = ColorManager.grey2
                                        } else {
                                            selectedFriends.append(friends[0].id)
                                            colors[0] = ColorManager.grey3
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                            
                            if friends.count > 1 {
                                RectView(user: user, friend: friends[1], color: colors[1])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[1].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[1].id }
                                            colors[1] = ColorManager.grey2
                                        } else {
                                            selectedFriends.append(friends[1].id)
                                            colors[1] = ColorManager.grey3
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                        }
                        
                        Spacer()
                            .frame(height: 15)
                        HStack {
                            if friends.count > 2 {
                                RectView(user: user, friend: friends[2], color: colors[2])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[2].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[2].id }
                                            colors[2] = ColorManager.grey2
                                        } else {
                                            selectedFriends.append(friends[2].id)
                                            colors[2] = ColorManager.grey3
                                        }
                                        print(selectedFriends)
                                    })
                            }
                            
                            if friends.count > 3 {
                                RectView(user: user, friend: friends[3], color: colors[3])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[3].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[3].id }
                                            colors[3] = ColorManager.grey2
                                        } else {
                                            selectedFriends.append(friends[3].id)
                                            colors[3] = ColorManager.grey3
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                            
                            if friends.count > 4 {
                                RectView(user: user, friend: friends[4], color: colors[4])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[4].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[4].id }
                                            colors[4] = ColorManager.grey2
                                        } else {
                                            selectedFriends.append(friends[4].id)
                                            colors[4] = ColorManager.grey3
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                        }
                        
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        
                        Button(action: {
                            counter += 1
                            shareTapped = true
                            shareButtonTapped()
                            sendMessage()
                        },
                               label: {
                            Image("iconShare")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .rotationEffect(.degrees(20))
                                .foregroundColor(ColorManager .purple5)
                                .glow(color: Color.purple, radius: 2)
                                .opacity(0.6)
                                .blinking(duration: 3.0)
                                .alert("Your 'thanks' for the song was sent.", isPresented: $showingAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                            
                            
                        })
                        
                        VStack {
                            
                            
                            Button(action: {
                                sessionManager.showLogin()
                            },
                                   label: {
                                Image("home-alt2")
                                    .frame(width: 50, height: 25)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .background(ColorManager .grey3)
                                    .cornerRadius(15)
                                    .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                                    .opacity(0.70)
                                
                            })
                            
                            Spacer()
                                .frame(height: 100)
     
                        }
              
                    }
                 
                }
                
            }
            
        }
        
    }
    
                        
                        
    func shareButtonTapped() {
        if selectedFriends.count == 0 { return }
        for id in selectedFriends {
            for f in friends {
                if f.id == id {
                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "  \(user.firstName) Hey, thanks for the song. I'm sure it will help.", APNToken: f.APNToken)
                    
                    //MARK: The code below creates an in-app notification for your friend (f.id)
                    //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
                    RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "Thanks, your song really hit the spot!", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
                        print("Create a New Song notification response code: ", response)
                    })
                    RestApi.instance.createStreakLog(friendID: f.id)
                }
            }
        }
        shareColor = ColorManager.darkGrey
        showingAlert = true
    }
    
    struct RectView: View {
        let user: User
        let friend: User
        let color: Color
        
        var body: some View {
            Text(friend.firstName + " " + String(friend.lastName.first!))
                .fontWeight(.bold)
                .frame(width: 80, height: 80)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .font(.system(size: 8))
                .background(color)
                .cornerRadius(75)
                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
        }
    }
}

            


//**************************************************************

//*******************************************************
//import Foundation
//import SwiftUI
//import ConfettiSwiftUI
//import AVKit
//
//struct CH7: View {
//
//    @EnvironmentObject var sessionManager: SessionManager
//
//    let user: User
//    let friends: [User]
//
//    @State private var selectedFriends: [String] = []
//    @State private var colors: [Color] = [ColorManager.purple3, ColorManager.purple3, ColorManager.purple3, ColorManager.purple3, ColorManager.purple3]
//    @State private var shareColor = ColorManager.purple5
//    @State private var showingAlert = false
//
//    @State private var counter = 0
//
//    @State private var mood: Int = -1
//    @State private var summary = ""
//    @State private var sharedWith: [String] = []
//    @State private var colorChangeTap: String = ""
//    @State private var shareTapped: Bool = false
//
//
//
//    var body: some View {
//
//        ZStack {
//
//
//            if shareTapped {
//
//
//
//                Color.black
//                                .ignoresSafeArea()
//                                .onAppear()
//
//
//                AdPlayerView(name: "dramaLights")
//                    .ignoresSafeArea()
//                    .blendMode(.screen)
//
//            } else {
//
//
//                Image("FHBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//            }
//
////            Color.black
//////                    .opacity(0.5)
////                .ignoresSafeArea()
////                .onAppear()
////
////
////
////            AdPlayerView(name: "sky2")
////                .ignoresSafeArea()
////                .blendMode(.screen)
//
//
//
//            VStack{
//
//                HStack {
//                    VStack {
//
//                        Text("")
//                            .font(.system(size: 35, weight: .ultraLight))
//                            .foregroundColor(ColorManager .grey2)
//
//
//                    }
//
//
//                    Image("MusicImage")
//                        .frame(width: 375, height: 375)
//                        .cornerRadius(15)
//                        .shadow(color: ColorManager .purple4, radius: 5, x: 5, y: 5)
//                        .opacity(0.7)
//
//
//                }
//
//
//                VStack {
//
//
//                    Spacer()
//                        .frame(height: 30)
//
//                }
//
//
//
//
//
//
//                VStack {
//
//                    Text("You were just sent a new song in Chat")
//                                            .font(.system(size: 20))
//                                            .foregroundColor(ColorManager .grey2)
//                                            .fontWeight(.light)
//                                            .multilineTextAlignment(.center)
//
//
//
//                    Spacer()
//                        .frame(height: 10)
//
//                    Text("(send a thank you)")
//                                            .font(.system(size: 15))
//                                            .italic()
//                                            .foregroundColor(ColorManager .grey2)
//                                            .fontWeight(.light)
//                                            .multilineTextAlignment(.center)
//
//                    VStack {
//
//                        Spacer()
//                            .frame(height: 15)
//
//
//                        HStack {
//
////                            Text("select >")
////                                .fontWeight(.thin)
////                                .frame(width: 100, height: 30)
////                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
////                                .font(.system(size: 20))
////                                .background(Color(hue: 0.555, saturation: 1.0, brightness: 0.845))
////                                .cornerRadius(25)
////                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                            //                                })
//
//                            if friends.count > 0 {
//                                RectView(user: user, friend: friends[0], color: colors[0])
//                                    .onTapGesture(perform: {
//                                        if selectedFriends.contains(friends[0].id) {
//                                            selectedFriends = selectedFriends.filter { $0 != friends[0].id }
//                                            colors[0] = ColorManager.purple3
//                                        } else {
//                                            selectedFriends.append(friends[0].id)
//                                            colors[0] = ColorManager.purple5
//                                        }
//                                        print(selectedFriends)
//                                    })
//
//                            }
//
//                            if friends.count > 1 {
//                                RectView(user: user, friend: friends[1], color: colors[1])
//                                    .onTapGesture(perform: {
//                                        if selectedFriends.contains(friends[1].id) {
//                                            selectedFriends = selectedFriends.filter { $0 != friends[1].id }
//                                            colors[1] = ColorManager.purple3
//                                        } else {
//                                            selectedFriends.append(friends[1].id)
//                                            colors[1] = ColorManager.purple5
//                                        }
//                                        print(selectedFriends)
//                                    })
//
//                            }
//                        }
//
//                        Spacer()
//                            .frame(height: 15)
//                        HStack {
//                            if friends.count > 2 {
//                                RectView(user: user, friend: friends[2], color: colors[2])
//                                    .onTapGesture(perform: {
//                                        if selectedFriends.contains(friends[2].id) {
//                                            selectedFriends = selectedFriends.filter { $0 != friends[2].id }
//                                            colors[2] = ColorManager.purple3
//                                        } else {
//                                            selectedFriends.append(friends[2].id)
//                                            colors[2] = ColorManager.purple5
//                                        }
//                                        print(selectedFriends)
//                                    })
//                            }
//
//                            if friends.count > 3 {
//                                RectView(user: user, friend: friends[3], color: colors[3])
//                                    .onTapGesture(perform: {
//                                        if selectedFriends.contains(friends[3].id) {
//                                            selectedFriends = selectedFriends.filter { $0 != friends[3].id }
//                                            colors[3] = ColorManager.purple3
//                                        } else {
//                                            selectedFriends.append(friends[3].id)
//                                            colors[3] = ColorManager.purple5
//                                        }
//                                        print(selectedFriends)
//                                    })
//
//                            }
//
//                            if friends.count > 4 {
//                                RectView(user: user, friend: friends[4], color: colors[4])
//                                    .onTapGesture(perform: {
//                                        if selectedFriends.contains(friends[4].id) {
//                                            selectedFriends = selectedFriends.filter { $0 != friends[4].id }
//                                            colors[4] = ColorManager.purple3
//                                        } else {
//                                            selectedFriends.append(friends[4].id)
//                                            colors[4] = ColorManager.purple5
//                                        }
//                                        print(selectedFriends)
//                                    })
//
//                            }
//                        }
//
//
//
//                        Spacer()
//                            .frame(height: 20)
//
//
//                        Button(action: {
//                            counter += 1
//                            shareTapped = true
//                            shareButtonTapped()
//                        },
//                               label: {
//                            Text("SHARE")
//
//                                .fontWeight(.thin)
//                                .frame(width: 100, height: 30)
//                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                .font(.system(size: 25))
//                                .background(shareColor)
//                                .cornerRadius(25)
//                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                                .alert("Your thank you has been sent", isPresented: $showingAlert) {
//                                    Button("OK", role: .cancel) { }
//                                }
//                        })
//                        .confettiCannon(counter: $counter)
//
//
//                        VStack {
//
//
//                                 Button(action: {
//                                     sessionManager.showLogin()
//                                 },
//                                     label: {
//                                     Image("home-alt2")
//                                         .frame(width: 50, height: 25)
//                                         .foregroundColor(.white)
//                                         .font(.system(size: 20))
//                                         .background(ColorManager .grey2)
//                                         .cornerRadius(15)
//                                         .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
//                                         .opacity(0.70)
//
//                                 })
//
//
//
//
//                        }
//
//
//
//                        }
//
//
//
//
//                    Spacer()
//                        .frame(height: 50)
//
//                }
//
//            }
//
//        }
//
//    }
//
//
////body: "\(user.firstName)
//
//    func shareButtonTapped() {
//        if selectedFriends.count == 0 { return }
//        for id in selectedFriends {
//            for f in friends {
//                if f.id == id {
////                    RestApi.instance.sendPushNotification(title: "BestFriends", body: " A freind said thank you for the song", APNToken: f.APNToken)
//
//                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "  \(user.firstName) said thank you for the song", APNToken: f.APNToken)
//
//
//                    //MARK: The code below creates an in-app notification for your friend (f.id)
//                    //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
//                    RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "Perfect! Thanks for the song.", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
//                        print("Create a song notification response code: ", response)
//                    })
//
//                    RestApi.instance.createStreakLog(friendID: f.id)
//
//                }
//            }
//        }
//        shareColor = ColorManager.darkGrey
//        showingAlert = true
//    }
//
//    struct RectView: View {
//        let user: User
//        let friend: User
//        let color: Color
//
//        var body: some View {
//            Text(friend.firstName + " " + String(friend.lastName.first!))
//                .fontWeight(.bold)
//                .frame(width: 80, height: 80)
//                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                .font(.system(size: 8))
//                .background(color)
//                .cornerRadius(75)
//                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//        }
//    }
//
//
//
//}
