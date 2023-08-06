//
//  CH4.swift
//  BestFriends
//
//  Created by Zhengxu Wang on 7/11/23.
//



import Foundation
import SwiftUI
import ConfettiSwiftUI
import AVKit
import Combine


struct CH4: View {
    
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
        
        customMessage = "NEW SONG from; " + user.firstName + " : " + customMessage;
        
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
                      

                      
                      Image("FHBackground")
                          .ignoresSafeArea()
                          .scaledToFit()
                          .opacity(0.5)

                      AdPlayerView(name: "dramaLights")
                          .opacity(0.5)
                          .ignoresSafeArea()
                          .blendMode(.screen)
                      
                  } else {

                      ColorManager.grey4
                          .opacity(0.99)
                          .ignoresSafeArea()
               

                      Image("CareHeartBalloon 1")
                          .ignoresSafeArea()
                          .scaledToFit()
                          .opacity(0.6)
                      
                      AdPlayerView(name: "sky2")
                          .ignoresSafeArea()
                          .blendMode(.screen)
             
                      
            }
            
        
//           *************************************

                VStack{
                    
                    HStack {
                        VStack {
                       
                            
                            ZStack {
                          
                            
                                VStack {
                                    HStack {
                                        VStack {
                                            
                                            Spacer()
                                                .frame(height: 70)
                                            
                                            Text("sending")
                                                .font(.system(size: 40, weight: .light))
                                                .foregroundColor(Color.white)
                                           
                                            Text("Music")
                                                .font(.system(size: 55, weight: .light))
                                                .foregroundColor(Color.white)
                                         
                                            
                                        }
                                       
                                        

                                }
                                    
                                       Spacer()
                                           .frame(height: 7)
//
//
//                                    Text("Did you just find a new song?")
//                                        .font(.system(size: 23))
//                                        .fontWeight(.light)
//                                        .foregroundColor(Color.white)
//                                        .multilineTextAlignment(.center)
//
//                                    Text("Show it off to a friend")
//                                        .font(.system(size: 23))
//                                        .fontWeight(.light)
//                                        .foregroundColor(Color.white)
//                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                        .frame(height: 15)

                                    Text("Is a friend having a tough day?")
                                        .font(.system(size: 23))
                                        .fontWeight(.light)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.center)
                                    
                                    Text("Send a song that helps you")
                                        .font(.system(size: 23))
                                        .fontWeight(.light)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.center)
                         
                                    
                                    ZStack(alignment: .bottom) {
                                            Image("")
                                                .resizable()
                                                .frame(width: 350, height: 48)
                                                .background(Color.green)
                                                .cornerRadius(10)
                                        
                                

                                            VStack {
                                                Spacer()
                                                // TextField for userInput
                                                TextField("", text: $customMessage)
                                                    .placeholder(when: customMessage.isEmpty) {
                                                        HStack {
                                                            Text("Type name of song here")
                                                                .foregroundColor(Color.white)
                                                                .fontWeight(.thin)
                                                            Spacer()
                                                        }
                                                    }
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 20))
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
                                  
                                }
                               
                            }
                           
                        }
                      
                    }
                    
                    
                    VStack {
  
                        
                            Spacer()
                                .frame(height: 30)
                    }
          
                VStack {

                    Text("(alert friend to look for the Song in Chat)")
                        .font(.system(size: 17))
                        .italic()
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
            
                    VStack {
                        
                        Spacer()
                            .frame(height: 5)
                        
                        
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
                                .alert("Your Song \nhas been sent to Chat.", isPresented: $showingAlert) {
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
                            
               Spacer ()
     
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
                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "  \(user.firstName) just sent you a Song in Chat", APNToken: f.APNToken)
                    
                    //MARK: The code below creates an in-app notification for your friend (f.id)
                    //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
                    RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "Just sent you a Song in Chat", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
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
