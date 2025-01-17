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
        
        customMessage = "SONG from; " + user.firstName + " : " + customMessage;
        
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
                      
//                      Color.black
//                        .opacity(0.9)
//                        .ignoresSafeArea()
                      
                      ColorManager.purple4
                          .ignoresSafeArea()
                          .onAppear()

                      AdPlayerView(name: "dramaLights")
                          .opacity(0.5)
                          .ignoresSafeArea()
                          .blendMode(.screen)
                      
                  } else {

                      
                      ColorManager .darkGrey
                        .opacity(0.9)
                        .ignoresSafeArea()
                      
                      AdPlayerView(name: "sky2")
                          .ignoresSafeArea()
                          .blendMode(.screen)
                          .opacity(0.5)
             
                      AdPlayerView(name: "grayDots2")
                          .ignoresSafeArea()
                          .blendMode(.screen)
                          .opacity(0.7)
            }
            

            
            VStack {
                
   
                VStack {
                    Spacer()
                        .frame(height: 30)
                 
              
           
                    
//***************************************************
                    VStack {
                   
                        
                        
                        ZStack {
                            
//                           Image(systemName: "circle.fill")
//                                .resizable()
//                                .foregroundColor(Color.purple)
//                                .frame(width: 240, height: 170)
//                                .shadow(color: ColorManager .purple3, radius: 65, x: 30, y: 50)
//                                .opacity(0.4)
                            
                            VStack {
                                
                                Text("Friend having")
                                    .font(.system(size: 27, weight: .light))
                                    .foregroundColor(Color.white)
                                    .opacity(0.5)
//
                                Text("a bad day?")
                                    .font(.system(size: 27, weight: .light))
                                    .foregroundColor(Color.white)
                                    .opacity(0.5)
                                
                               
                            }
                        
                        }
                    }
                    

                    HStack {

                        ZStack {
                            Image("")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 50, height: 20)
                                .shadow(color: Color.white, radius: 3, x: 3, y: 3)
                                .opacity(0.5)
                                .blinking(duration: 3.0)

                            VStack {


                            

                            }
                        }

//
                        ZStack {


                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundColor(Color.purple)
                                .frame(width: 300, height: 150)
                                .shadow(color: Color.white, radius: 3, x: 3, y: 3)
                                .rotationEffect(.degrees(-7))
                                .opacity(0.3)
//                                .blinking(duration: 5.0)

                            VStack {

                                Text("You know that song you listen to")
                                    .font(.system(size: 13))
                                    .italic()
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.white)
                                    .rotationEffect(.degrees(-7))
//                                    .blinking(duration: 5.0)

                                Text("over-and-over while lying in bed,")
                                    .font(.system(size: 13))
                                    .italic()
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.white)
                                    .rotationEffect(.degrees(-7))
//                                    .blinking(duration: 5.0)



                                Text("covers over your head,")
                                    .font(.system(size: 13))
                                    .italic()
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.white)
                                    .rotationEffect(.degrees(-7))
//                                    .blinking(duration: 5.0)
                                
                                
                                Text("when you're having a truely bad day.")
                                    .font(.system(size: 13))
                                    .italic()
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color.white)
                                    .rotationEffect(.degrees(-7))
//                                    .blinking(duration: 5.0)
                                
                                
                                Spacer ()
                                    .frame(height: 20)

                            }
                        }
                    }
//           ***************************************************
//
        ZStack {
                                           
                VStack {
//                         Spacer()
                    // TextField for userInput
                    TextField("", text: $customMessage)
                        .placeholder(when: customMessage.isEmpty) {
                            HStack {
                                VStack {
                                    Text("Send name of song to Chat")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.thin)

                                    
                                    Spacer()
                                        .frame(height: 20)
                                    
                                }
                                
                                
                                Spacer()
                            }
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .submitLabel(.done)
                        .onReceive(Just(customMessage)) { _ in limitText(65) }
                        .padding(.top, 20)
                        .padding(.horizontal, 80)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple)
                            //                                                            .background(ColorManager.purple3)
                                .frame(height: 50)
                                .padding(.horizontal, 50)
                        )
                        .padding(.bottom, 5)
                    
                    
                                                    
                }
            }

        
            
                    VStack {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        
                        Text("(alert friend to check in Chat)")
                            .font(.system(size: 15, weight: .light))
                            .italic()
                            .foregroundColor(Color.white)
                        
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
                                .frame(width: 90, height: 90)
                                .rotationEffect(.degrees(20))
                                .foregroundColor(ColorManager .purple5)
                                .glow(color: Color.purple, radius: 2)
                                .opacity(0.6)
                                .blinking(duration: 3.0)
                                .alert("Your song \nhas been sent to Chat. \n\nYou're a great friend - something not often seen these days.", isPresented: $showingAlert) {
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
                                    .background(ColorManager .grey1)
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
                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "  \(user.firstName) just sent you a Song. Check Chat and 'received' CareHearts", APNToken: f.APNToken)
                    
                    //MARK: The code below creates an in-app notification for your friend (f.id)
                    //MARK: DO NOT CHANGE THE TEXT OF THE NOTIFICATION, otherwise the code to take the user to a diffrent page will not work. Once you set it, do not change it.
                    RestApi.instance.createInAppNotification(ian: InAppNotification(user: f.id, sender: user.id, text: "You just got a song (check Chat) - TAP", createdOn: Int64(Date().timeIntervalSince1970))).then({ response in
                        print("Create a That Song notification response code: ", response)
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

            
