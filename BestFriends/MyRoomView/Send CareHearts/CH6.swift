//
//  CH6.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/11/23.
//




import Foundation
import SwiftUI
import ConfettiSwiftUI
import AVKit
import Combine


struct CH6: View {
    
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
        
        customMessage = "Custom CareHeart; " + user.firstName + " : " + customMessage;
        
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
                        .opacity(0.9)
                        .ignoresSafeArea()
                      
//                      Image("FHBackground")
//                          .ignoresSafeArea()
//                          .scaledToFit()
//                          .opacity(0.1)

                      AdPlayerView(name: "dramaLights")
                          .opacity(0.5)
                          .ignoresSafeArea()
                          .blendMode(.screen)
                      
                  } else {

                      Image("CareHeartBalloon 1")
                          .ignoresSafeArea()
                          .scaledToFit()
                          .opacity(0.1)
                      
                      Color.black
                        .opacity(0.9)
                        .ignoresSafeArea()
                      
                      AdPlayerView(name: "sky2")
                          .ignoresSafeArea()
                          .blendMode(.screen)
             
                      
            }
            

            
        VStack {
        
            ZStack {
                                                
                                                
                Text("Custom CareHearts")
                    .font(.system(size: 43, weight: .light))
                    .foregroundColor(ColorManager .grey1)
                                                
                                        
                                        
                    VStack {
                        Spacer()
                                                  
                        // TextField for userInput
                        TextField("", text: $customMessage)
                            .placeholder(when: customMessage.isEmpty) {
                                HStack {
                                    Text("Type your message here")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.thin)
                                    Spacer()
                                }
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .submitLabel(.done)
                            .onReceive(Just(customMessage)) { _ in limitText(65) }
                            .padding(.top, 20)
                            .padding(.horizontal, 150)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.purple)
                                //                                                            .background(ColorManager.purple3)
                                    .frame(height: 50)
                                    .padding(.horizontal, 125)
                            )
                            .padding(.bottom, 5)
                        
                                                    
                                                }
                                        }

                    
                    
                    VStack {
                   

//                        Text("- tap heart for draw")
//                            .font(.system(size: 15, weight: .light))
//                            .italic()
//                            .foregroundColor(Color.white)
//
//                        Text("- send a message in Chat")
//                            .font(.system(size: 15, weight: .light))
//                            .italic()
//                            .foregroundColor(Color.white)
//
//                        Text("- send a PhotoPOP")
//                            .font(.system(size: 15, weight: .light))
//                            .italic()
//                            .foregroundColor(Color.white)
//
                        Spacer()
                            .frame(height: 30)

                      
          
                VStack {
                    
                    
                    ZStack {
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(Color.purple)
                            .frame(width: 230, height: 170)
                            .shadow(color: ColorManager .purple3, radius: 65, x: 30, y: 50)
                            .opacity(0.5)
                        
                        VStack {
                            
                       
                                
                                NavigationLink( destination: DrawingCareHearts(),
                                                label: {
                                    Text("Draw Custom \nCareheart")
                                        .fontWeight(.regular)
                                        .frame(width: 120, height: 45)
                                        .foregroundColor(ColorManager .grey4)
                                        .font(.system(size: 16))
                                        .background(ColorManager .purple2)
                                        .glow(color: ColorManager.purple3, radius: 1)
                                        .shadow(color: .white, radius: 3, x: -4, y: 4)
                                        .opacity(0.9)
                                        .cornerRadius(7)
                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
                                    
                                })
                            
                            
                            Spacer()
                                .frame(height: 15)
                            
                            NavigationLink(
                                destination:  PhotoPopView(user: user, friends: friends),
                                label: {
                                    
                                    Image(systemName: "camera")
                                      
                                       .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.cyan)
                                        .glow(color: ColorManager.purple4, radius: 2)
                                        .opacity(0.6)
  
                                })
                            
                        }
                         
                            

                        }
                    }
                        
                        
                        
                        Spacer()
                            .frame(height: 20)
                
                    Text("(alert friend")
                        .font(.system(size: 15))
                        .italic()
                        .fontWeight(.light)
                        .foregroundColor(ColorManager .grey1)
                        .multilineTextAlignment(.center)

              
            
                    VStack {
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
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
                            Text("SHARE")
                            
                                .fontWeight(.thin)
                                .frame(width: 100, height: 30)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 25))
                                .background(ColorManager .grey2)
                                .cornerRadius(25)
                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                                .alert("Your Custom CareHeart is on it's way! \n\nSend them a message in Chat \nand a PhotoPOP", isPresented: $showingAlert) {
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
                                .frame(height: 160)
     
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
                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "  \(user.firstName) just sent you a Custome CareHeart", APNToken: f.APNToken)
                    
                    //MARK: The code below creates an in-app notification for your friend (f.id)
                    //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
                    RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "Just sent you a Custome CareHeart. Check for a message in Chat and a PhotoPOP ... TAP", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
                        print("Create a Custom CareHeart notification response code: ", response)
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

            

//
//import Foundation
//import SwiftUI
//import ConfettiSwiftUI
//import AVKit
//
//struct CH6: View {
//
//    @EnvironmentObject var sessionManager: SessionManager
//
//    let user: User
//    let friends: [User]
//    let groups: [Group]
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
//
//
//                  if shareTapped {
//
//                      Color.black
//                          .opacity(0.8)
//                          .ignoresSafeArea()
//
//                      AdPlayerView(name: "dramaLights")
//                          .opacity(0.5)
//                          .ignoresSafeArea()
//                          .blendMode(.screen)
//
//                  } else {
//
//                      Image("CareHeartBalloon 1")
//                          .ignoresSafeArea()
//                          .scaledToFit()
//                          .opacity(0.1)
//
//                      ColorManager .grey3
//                        .opacity(0.9)
//                        .ignoresSafeArea()
////
////                      Image("CHHearts")
////                          .resizable()
////                          .scaledToFit()
//////                          .frame(width: 37, height: 37)
////                          .opacity(0.2)
//////                          .foregroundColor(.white)
//
//                      AdPlayerView(name: "PlanetSave2")
//                          .ignoresSafeArea()
//                          .blendMode(.screen)
//                          .opacity(0.6)
//            }
//
//            VStack{
//
//                ZStack {
////                    VStack {
//                        Image(systemName: "heart.fill")
//                            .resizable()
//                            .foregroundColor(Color.purple)
//                            .frame(width: 250, height: 200)
//                            .shadow(color: ColorManager .purple3, radius: 65, x: 30, y: 50)
//                            .opacity(0.5)
//
//                        Text("Custom CareHearts")
//                            .font(.system(size: 35))
//                            .foregroundColor(Color.white)
//                            .fontWeight(.light)
//                            .multilineTextAlignment(.center)
//                    }
////                }
//
//
//                HStack {
//                    VStack {
//
//
//
//                        ZStack {
//
//
//                            VStack {
//
////
//                            }
//                        }
//                    }
//                }
//
//
//
//                VStack {
//
//
//                    Spacer()
//                        .frame(height: 10)
//
////                    Text("-----------")
////                                            .font(.system(size: 20))
////                                            .foregroundColor(Color.white)
////                                            .fontWeight(.light)
////                                            .multilineTextAlignment(.center)
////
////                    Spacer()
////                        .frame(height: 10)
////
////                    Text("------------")
////                                            .font(.system(size: 20))
////                                            .foregroundColor(Color.white)
////                                            .fontWeight(.light)
////                                            .multilineTextAlignment(.center)
//
//                    Spacer()
//                        .frame(height: 30)
//
//                    Text("(alert friend)")
//                                            .font(.system(size: 15))
//                                            .italic()
//                                            .foregroundColor(Color.white)
//                                            .fontWeight(.light)
//                                            .multilineTextAlignment(.center)
//
//
//                    VStack {
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
//                                .alert("Your Custom CareHeart has been sent", isPresented: $showingAlert) {
//                                    Button("OK", role: .cancel) { }
//                                }
//                        })
////                        .confettiCannon(counter: $counter)
//
//
//                            VStack {
//
//                                Spacer()
//                                    .frame(height: 20)
//
////                                NavigationLink( destination:  RR11(user: user, friend: user, friends: friends, groups: groups),
////                                                label: {
////                                    Text("Send Hearts back")
////                                        .fontWeight(.bold)
////                                        .frame(width: 200, height: 40)
////                                        .foregroundColor(Color.black)
////                                        .font(.system(size: 16))
////                                        .background(Color.cyan)
////                                        .glow(color: ColorManager.purple1, radius: 1)
////                                        .shadow(color: .white, radius: 3, x: -4, y: 4)
////                                        .opacity(0.9)
////                                        .cornerRadius(15)
////                                        .shadow(color: Color.white, radius: 2, x: 0, y: 2)
////                                })
//
//                                Spacer()
//                                    .frame(height: 15)
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
//
//                                })
//
//
//
//                            Spacer()
//                                .frame(height: 100)
//
//
//                        }
//                    }
//                }
//
//            }
//
//        }
//
//    }
//
//
//    func shareButtonTapped() {
//        if selectedFriends.count == 0 { return }
//        for id in selectedFriends {
//            for f in friends {
//                if f.id == id {
//                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "\(user.firstName) Just sent you a Custom CareHeart!", APNToken: f.APNToken)
//
//                    //MARK: The code below creates an in-app notification for your friend (f.id)
//                    //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
//                    RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "Just sent you a Custom CareHeart!", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
//                        print("Create a Custom CareHeart notification response code: ", response)
//                    })
//                    RestApi.instance.createStreakLog(friendID: f.id)
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
//                .frame(width: 70, height: 70)
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
//
//
