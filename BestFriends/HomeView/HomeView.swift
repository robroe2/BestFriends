//
//  LoginView.swift
//  BestFriends
//
//  Created by Alex Titov on 4/16/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
//        let user: User
//        let friends: [User]
    //
//        let user: User
//        let atmosphere: Atmosphere
    
    @State private var homeData: HomeData?
    @State private var groups: [Group] = []
    @State private var planets: [Planet] = []
    
    @State private var selectedPlanet: Planet?
    
    @State private var focusPlanet = false
    @State private var showNewRoomNameDialog = false
    
    @State private var newGroupMembers: [String] = []
    
    @State private var chatGroupsView = ChatGroupsView(user: User(id: "", firstName: "", lastName: "", APNToken: "", atmosphere: "", chatPin: "", chatBackground: ""), groups: [])
    
    @State private var presentingPhotoPop = false
    var body: some View {
        NavigationView {
            
            
            ZStack {
                
                Color .black
                  .ignoresSafeArea()
                  .onAppear()
                
//                //
//                //            Image("purpleBackground")
//                //                .resizable()
//                //                .ignoresSafeArea()
//                //                .scaledToFill()
//                //                .onAppear(perform: loadData)
//                //
//                //            AdPlayerView(name: "background_1")
//                //                .ignoresSafeArea()
//                //                .blendMode(.screen)
//
//
//                             ColorManager.grey4
//                                 .ignoresSafeArea()
//                                 .onAppear()
//
//                 //            Image("blueBackground")
//                 //                .resizable()
//                 //                .ignoresSafeArea()
//                                 .scaledToFill()
//                //                 .onAppear(perform: loadData)
//                //                 .sheet(isPresented: $isShowPhotoLibrary) {
//                //                     ImagePicker(image: $attachmentImage, sourceType: .photoLibrary)
//                //                         .onDisappear { createPhotoPop() }
//
//                            AdPlayerView(name: "background_1")
//                                          .ignoresSafeArea()
//                                           .blendMode(.screen)
//
             
                
//                ColorManager .grey4
//                  .ignoresSafeArea()
//                  .onAppear()
//                
//                ColorManager .orange5
//                  .ignoresSafeArea()
//                  .onAppear()
                
                // Background Image...
//                Image("purpleBackground")
//                    .resizable()
//                    .scaledToFill()
                    .ignoresSafeArea()
                    .onAppear {
                        if RestApi.instance.needLogin {
                            sessionManager.showLogin()
                        } else {
                            getHomeData()
                        }
                    }
                    .onShake {
                        presentingPhotoPop = true
                    }
                    .fullScreenCover(isPresented: $presentingPhotoPop, content: ShakePhotoPopView.init)
                
                // Stars animation...
                AdPlayerView(name: "sky2")
                    .ignoresSafeArea()
                //                    .scaledToFill()
                    .blendMode(.screen)
                    .onTapGesture(perform: backgroundTapped)
                
      
                
                
                VStack {
                    
//                    NavigationLink(
//                       destination: YouGotThis(user: user, friends: friends),
//                       label: {
//                           Text(". . .")
//                               .fontWeight(.thin)
//                               .frame(width: 250, height: 40)
//                               .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                               .font(.system(size: 30))
//                               .background(ColorManager.purple3)
//                               .onTapGesture(perform: {
//                               .cornerRadius(15)
//                               .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                       })
//
//
//
//                    Image(systemName: "info.circle")
//                        .resizable()
//                        .frame(width: 27, height: 27)
//                        .scaledToFill()
//                        .foregroundColor(.white)
//                        .onTapGesture(perform: {
//                            sessionManager.infoView(user: user, group: group)
//                        })
                    
//                    Image(systemName: "info.circle")
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .scaledToFill()
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                        .onTapGesture(perform: {
//
//                        })
                   
                    
                    
                    
                    
                    Spacer()
                        .frame(height: 100)
                    
                    // Top 2 planets
                    
                    
                    HStack {
                        if planets.count > 0 && !focusPlanet {
                            planets[0]
                                .onTapGesture(perform: { friendPlanetTapped(id: planets[0].user.id)
                                    if (selectedPlanet != nil) && selectedPlanet!.user.id == planets[0].user.id {
                                        selectedPlanet = nil
                                    } else {
                                        selectedPlanet = planets[0]
                                    }
                                })
                        }
                        
                        if planets.count > 1 && !focusPlanet {
                            Spacer()
                                .frame(width: 35)
                            //                                .frame(width: 40, height: 40)
                            //                                .offset(x: showItems ? 75 : 0, y: showItems ? 125: 0)
                            
                            planets[1]
                                .onTapGesture(perform: { friendPlanetTapped(id: planets[1].user.id)
                                    if (selectedPlanet != nil) && selectedPlanet!.user.id == planets[1].user.id {
                                        selectedPlanet = nil
                                    } else {
                                        selectedPlanet = planets[1]
                                    }
                                })
                        }
                        if planets.count > 2 && !focusPlanet {
                            Spacer()
                                .frame(width: 35)
                            planets[2]
                                .onTapGesture(perform: { friendPlanetTapped(id: planets[2].user.id)
                                    if (selectedPlanet != nil) && selectedPlanet!.user.id == planets[2].user.id {
                                        selectedPlanet = nil
                                    } else {
                                        selectedPlanet = planets[2]
                                    }
                                    
                                })
                        }
                    }
                    // Main planet
                    
                    
                    
                    
                    // Bottom 3 planets
                    HStack {
                        
                        
                        if planets.count > 3 && !focusPlanet {
                            
                            
                            planets[3]
                                .onTapGesture(perform: { friendPlanetTapped(id: planets[3].user.id)
                                    if (selectedPlanet != nil) && selectedPlanet!.user.id == planets[3].user.id {
                                        selectedPlanet = nil
                                    } else {
                                        selectedPlanet = planets[3]
                                    }
                                    
                                })
                        }
                        if homeData != nil {
                            EmptyView()
                                .alert(isPresented: $showNewRoomNameDialog,
                                       TextAlert(title: "Create New Room",
                                                 message: "Input the desired name for the new chat room") { name in
                                    if let text = name {
                                        // Text was accepted
                                        print("Got name: ", text)
                                        createGroup(name: text)
                                    } else {
                                        // The dialog was cancelled
                                    }
                                })
                                .frame(width: 0, height: 0)
                            
                            ZStack {
                                // Main planet
                                if !focusPlanet {
                                    PlanetView(planet: homeData!.atmosphere.planet, mood: homeData!.atmosphere.mood)
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .onTapGesture(perform: mainPlanetTapped)
                                        .glow(color: glowColor(mood: homeData!.atmosphere.mood), radius: 20)
                                        .padding()
                                        .onAppear(perform: {print("Atm mood: ", homeData!.atmosphere.mood)})
                                    
                                }
                                
                                // Tapped on the main planet
                                if focusPlanet {
                                    PlanetActionsView(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, friendAtmospheres: homeData!.friendAtmospheres, groups: homeData!.groups)
                                        .environmentObject(sessionManager)
                                }
                                
                                
                            }
                        }
                        
                        //                        if planets.count > 4 && !focusPlanet {
                        
                        
                        // Old 3rd Bottom planet
                        if planets.count > 4 && !focusPlanet {
                            planets[4]
                                .onTapGesture(perform: { friendPlanetTapped(id: planets[4].user.id)
                                    if (selectedPlanet != nil) && selectedPlanet!.user.id == planets[4].user.id {
                                        selectedPlanet = nil
                                    } else {
                                        selectedPlanet = planets[4]
                                    }
                                })
                            
                            
                            
                        }
                        
                        
                        
                        //                                                   .padding(50)
                    }
                    
                    if newGroupMembers.count > 0 && !focusPlanet {
                        Button(action: {
                            chatButtonTapped()
                        }, label: {
                            Text("Create 'New' Chat Room")
                                .fontWeight(.regular)
                                .frame(width: 240, height: 30)
                                .foregroundColor(.white)
                                .background(ColorManager.purple3)
                                .cornerRadius(15)
                                .opacity(0.4)
                        })
                        
                    }
             
                    
                    Spacer()
                        .frame(height: 10)
               
                    
                    if selectedPlanet != nil {
                        if homeData!.groups.count > 0 {
                            NavigationLink(destination: UrgentChatInvite(user: homeData!.user, owner: homeData!.user, group: homeData!.groups[0]),
                                           label: {
                                Text("Urgent Chat Invite")
                                    .fontWeight(.light)
                                    .frame(width: 240, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                        }
                        
           
                        
                        Spacer().frame(height: 10)
                        
                        
                        HStack {
                            NavigationLink(destination: WhoFighting(user: homeData!.user, friends: homeData!.friends, groups: homeData!.groups),
                                           label: {
                                Text("Huge Fight - Not Talking")
                                    .fontWeight(.light)
                                    .frame(width: 240, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                            
                            

                        
                            NavigationLink(destination: FG_VideoCall(user: homeData!.user, friends: homeData!.friends, groups: homeData!.groups),
                                           
                                           label: {
                                Text("Hurt")
                                    .fontWeight(.light)
                                    .frame(width: 0, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                        }
                        
                   
                        Spacer()
                            .frame(height: 10)
                        
                        HStack {
                            NavigationLink(destination: VirtualHug(),
                                           label: {
                                Text("Received Hug")
                                    .fontWeight(.light)
                                    .frame(width: 115, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                            
                            
                            NavigationLink(destination: ReceivedPlaylist(),
                                           label: {
                                Text("Song 4 Mood")
                                    .fontWeight(.light)
                                    .frame(width: 115, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                        }
                        Spacer().frame(height:10)
                        
                        
                        HStack {
                            NavigationLink(destination: Friend1VaultPractice(user: homeData!.user, friend: selectedPlanet!.user, friends: homeData!.friends, groups: homeData!.groups, friendAtmosphere: selectedPlanet!.atmosphere),                                        label: {
                                Text("My Friend's Day Just Changed")
                                    .fontWeight(.light)
                                    .frame(width: 240, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                            
                         
                            
                            
                            
                            
                            NavigationLink(destination: DreamVaultView(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, friendAtmospheres: homeData!.friendAtmospheres, groups: homeData!.groups),
                                           label: {
                                Text("Dream Story")
                                    .fontWeight(.light)
                                    .frame(width: 0, height: 30)
                                    .foregroundColor(.white)
                                    .background(ColorManager.purple3)
                                    .cornerRadius(15)
                                    .opacity(0.4)
                            })
                        }
                        Spacer().frame(height:10)


                        NavigationLink(destination: DreamVaultView(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, friendAtmospheres: homeData!.friendAtmospheres, groups: homeData!.groups),
                                       label: {
                            Text("New Dream Poem posted")
                                .fontWeight(.light)
                                .frame(width: 240, height: 29)
                                .foregroundColor(.white)
                                .background(ColorManager.orange5)
//                                .background(ColorManager.purple3)
                                .cornerRadius(15)
                                .opacity(0.6)
                        })
                    
                        
                        Spacer()
                            .frame(height: 60)
                        
                    }
                    
                }
                Spacer()
                if homeData?.groups != nil && homeData?.user != nil {
                    ChatGroupsView(user: homeData!.user, groups: groups)
                        .environmentObject(sessionManager)
                    
                    //  MARK: When toggle between Home view and Planet the [Atmosphere] and [FiendValult] buttons show up on Plant view and do not go away on Home view when the fiend's planet is tapped.
                    //     MARK: Can not get the BlueMode to link to BlueMode page
                    
                    //                    if selectedPlanet != nil {
                    //                        AtmosphereMain2(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends)
                    //
                }
//                
//                VStack {
//                    Spacer()
//                        .frame(height: 100)
//
//                    HStack {
//                        Spacer()
//                        
//                        if homeData != nil {
//                            NavigationLink(destination: SettingsView(user: homeData!.user), label: {
//                                Image(systemName: "gear")
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
//                                    .scaledToFit()
//                                    .foregroundColor(.white)
//                            })
//                        }
//                        
//                    }
//                    .padding(40)
//                    
//                    Spacer()
//                }
//                .ignoresSafeArea()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func getHomeData() {
        RestApi.instance.getHomeData().then{ data in
            print("Got HomeData: ", data)
            homeData = data
            RestApi.instance.registerAPNToken()
            groups = homeData!.groups.sorted(by: { $0.createdOn > $1.createdOn })
            
            
            createPlanets()
            //            print("Got groups: ", data.groups.count)
            //            chatGroupsView = ChatGroupsView(groups: data.groups)
        }.catch { err in
            print("Got error")
            print(err)
        }
        
    }
    
    // Create plantes and populate the planets array
    private func createPlanets() {
        planets = []
        let friends: [User] = homeData?.friends ?? []
        let atmosperes: [Atmosphere] = homeData?.friendAtmospheres ?? []
        
        for friend in friends {
            for atmosphere in atmosperes {
                if friend.atmosphere == atmosphere.id {
                    // Found the friend - atmosphere pair
                    let planet = Planet(user: friend, atmosphere: atmosphere)
                    planets.append(planet)
                }
            }
        }
    }
    
    // Preform when main planet is tapped
    private func mainPlanetTapped() {
        if !focusPlanet {
            withAnimation {
                focusPlanet = true
            }
        }
    }
    
    // Preform when background (stars) is tapped
    private func backgroundTapped() {
        if focusPlanet {
            withAnimation {
                focusPlanet = false
            }
        }
    }
    
    // Get glow color for main planet
    private func glowColor(mood: Int) -> Color {
        switch mood {
        case 0:
            return Color(.systemCyan)
        case 1:
            return Color(.systemCyan)
        case 2:
            return Color(.systemCyan)
        case 3:
            return Color(.systemCyan)
        case 4:
            return Color(.systemGreen)
        case 5:
            return Color(.orange)
        case 6:
            return Color(.systemYellow)
        case 7:
            return Color(.systemYellow)
        case 8:
            return Color(.systemYellow)
        case 9:
            return Color(.systemYellow)
        default:
            return ColorManager.pmbc_blue
            
        }
    }
    
    private func friendPlanetTapped(id: String) {
        // Add/remove friend to group memebrs
        if newGroupMembers.contains(id) {
            newGroupMembers.remove(at: newGroupMembers.firstIndex(of: id) ?? 0)
        } else {
            newGroupMembers.append(id)
        }
        print(newGroupMembers.count)
    }
    
    private func chatButtonTapped() {
        if newGroupMembers.count > 0 {
            for newId in newGroupMembers {
                for f in homeData!.friends {
                    if f.id == newId {
                        //MARK: Sending push notification to friend "f"
                        RestApi.instance.sendPushNotification(title: "Group chat", body: homeData!.user.firstName + " " +  String(homeData!.user.lastName.first!) + "needs to talk", APNToken: f.APNToken )
                    }
                }
            }
            
            newGroupMembers.append(homeData!.user.id)
            for group in homeData!.groups {
                if group.members.containsSameElements(as: newGroupMembers) {
                    sessionManager.showChat(user: homeData!.user, group: group)
                    return
                }
            }
            showNewRoomNameDialog = true
        }
    }
    
    private func createGroup(name: String) {
        RestApi.instance.createGroup(name: name, members: newGroupMembers).then { response in
            print("Create Group response: ", response)
            sessionManager.showChat(user: homeData!.user, group: response)
        }
    }
    
    private func friendSentPlaylist(friend: User) {
        let arr = [friend.id, homeData!.user.id]
        for group in homeData!.groups {
            if group.members.containsSameElements(as: arr) {
                sessionManager.showChat(user: homeData!.user, group: group)
            }
            
            
//            Spacer()
//                .frame(height: 100)
            
        }
    }
    
}


