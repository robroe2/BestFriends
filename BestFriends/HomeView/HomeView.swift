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
    //        let atmosphere: Atmosphere
    //
    @State private var homeData: HomeData?
    @State private var groups: [Group] = []
    @State private var planets: [Planet] = []
    
    @State private var inviteClicked = false
    //    @State private var focusPlanet = false
    @State private var showNewRoomNameDialog = false
    
    @State private var newGroupMembers: [String] = []
    
    @State private var chatGroupsView = ChatGroupsView(user: User(id: "", firstName: "", lastName: "", APNToken: "", atmosphere: "", chatPin: "", chatBackground: ""), groups: [])
    
    @State private var presentingPhotoPop = false
    @State private var presentingIANs = false
    
    @State private var movingPlanets = false
    
//    @StateObject var model = Model.loadData
    
    @State private var scale = 1.0
    
    let reloadingTimer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            
            
            ZStack {
                Color .black
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
                    .onReceive(reloadingTimer) { time in
                        getHomeData()
                    }
                
                if (homeData != nil) {
                    NavigationLink(destination: NotificationsView(user: homeData!.user, friend: homeData!.user, friends: homeData!.friends, groups: homeData!.groups, atmosphere: homeData!.atmosphere), isActive: $presentingIANs) { EmptyView() }

                }
                
//            user: user, friend: user, friends: friends, groups: groups)
                
                // Stars animation...
                AdPlayerView(name: "background_9")
                    .ignoresSafeArea()
                    .blendMode(.screen)
//                    .opacity(0.99)
                
           
                
                VStack {
                    if ((homeData) != nil) {
                        
                        Spacer()

                        Spacer()
                            .frame(height: 530)
                      
                        HStack {
                  
                            ZStack {
                             
                                Image(systemName: "")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color.red)
//                                    .blinking(duration: 2.0)
                                    .glow(color: ColorManager.purple4, radius: 3)
                                    .opacity(0.5)
                                    .onTapGesture {
                                        print("Clicked notification bell")
                                        presentingIANs.toggle()
                                    }
                                
                                NavigationLink(destination: SaySomethingNice6(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, groups: homeData!.groups, friendAtmospheres: homeData!.friendAtmospheres), isActive: $inviteClicked
                                ) { EmptyView() }
                                
                                
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(Color.white)
                                    .opacity(0.6)
                                    .glow(color: Color.white, radius: 1)
                                    .blinking(duration: 2.0)
                               
                          
                                
                            }
                         
                        
//*******************************************

                            
                            
                            Spacer()
                                .frame(width: 20)

                            NavigationLink(
                                destination:  SettingsView(user: homeData!.user, friends: homeData!.friends, atmosphere: homeData!.atmosphere),
                                label: {
                                    
                                    Image(systemName: "gear")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(ColorManager .purple2)
//                                        .glow(color: ColorManager.purple4, radius: 3)
                                        .opacity(0.5)
                                })
                            
//          ********************************************** Carehearts *************
                            
    //          ********************************************** Carehearts *************
                      
                            Spacer()
                                .frame(width: 30)
                            
                            ZStack {
                             
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color.red)
//                                    .blinking(duration: 2.0)
                                    .glow(color: ColorManager.purple4, radius: 3)
                                    .opacity(0.5)
                                    .onTapGesture {
                                        print("Clicked notification bell")
                                        presentingIANs.toggle()
                                    }
                                
                                NavigationLink(destination: SaySomethingNice6(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, groups: homeData!.groups, friendAtmospheres: homeData!.friendAtmospheres), isActive: $inviteClicked
                                ) { EmptyView() }
                                
                                
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(Color.white)
                                    .opacity(0.6)
                                    .glow(color: Color.white, radius: 1)
                                    .blinking(duration: 2.0)
                               
                          
                                
                            }
                            
                            
                            
//        ******************************************************************
                            
                            
                            
                            Spacer()
                                .frame(width: 30)
                            
                            NavigationLink(
                                destination:  FH10(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, friendAtmospheres: homeData!.friendAtmospheres, groups: homeData!.groups),
                                label: {
                                    
                                    Image(systemName: "info.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(ColorManager .purple2)
//                                       .glow(color: ColorManager.purple4, radius: 3)
                                        .opacity(0.5)
                                })
                            
                            
                            Spacer()
                                .frame(width: 20)
                            
                            ZStack {
                                
                                Image(systemName: "circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color .green)
                                    .glow(color: ColorManager.purple4, radius: 20)
                                    .blinking(duration: 2.0)
                                
                   
                                NavigationLink( destination:  FH2(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, friendAtmospheres: homeData!.friendAtmospheres, groups: homeData!.groups),
                                                label: {
                                    Text("Start\nhere")
                                        .fontWeight(.regular)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 12))
//                                        .blinking(duration: 2.0)
                                    
                               
                                    
                                })
                                

                            }
                        }

                    }
                    
                   Spacer()

                }
                

                
                if homeData != nil {
                    FriendPlanetsView(planets: $planets, selectedPlanets: $newGroupMembers, inviteClicked: $inviteClicked)
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
                        
                        NavigationLink(destination: MyRoomView(user: homeData!.user, atmosphere: homeData!.atmosphere, friends: homeData!.friends, friendAtmospheres: homeData!.friendAtmospheres, groups: homeData!.groups), label: {
                            PlanetView(planet: homeData!.atmosphere.planet, mood: homeData!.atmosphere.mood)
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .glow(color: glowColor(mood: homeData!.atmosphere.mood), radius: 11)
                                .opacity(0.3)
                                .padding()
                            
                        })
                            Text("tap \nme")
                                .fontWeight(.light)
                                .frame(width: 45, height: 45)
                              .foregroundColor(Color.black)
                                .font(.system(size: 17))
                                .background(Color.green)
                                .multilineTextAlignment(.center)
                                .opacity(1.0)
                                .cornerRadius(10)
                                .shadow(color: Color.white, radius: 2, x: 0, y: 1)
                                .blinking(duration: 2.0)
//                        })
                    }
                        
                }
                
                if newGroupMembers.count > 0 {
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            chatButtonTapped()
                        }, label: {
                            Text("create new chat room")
                                .fontWeight(.light)
                                .frame(width: 250, height: 30)
                                .foregroundColor(.white)
                                .background(ColorManager .purple3)
                                .cornerRadius(10)
                                .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                                .opacity(0.5)
                        })
                        
                        Spacer()
                            .frame(height: 600)
                    }
                }
                
                if homeData?.groups != nil && homeData?.user != nil {
                    ChatGroupsView(user: homeData!.user, groups: groups)
                        .environmentObject(sessionManager)
                        .offset(y: -3)
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(ColorManager.purple5)
        
    }
    
    private func getHomeData() {
        RestApi.instance.getHomeData().then{ data in
            print("Got HomeData: ", data)
            homeData = data
            RestApi.instance.setStatusToOnline(id: data.user.id)
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
    
    // Get glow color for main planet
    private func glowColor(mood: Int) -> Color {
        switch mood {
        case 0:
            return Color(.systemRed)
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
            return Color(.systemRed)
        case 8:
            return Color(.systemYellow)
        case 9:
            return Color(.systemRed)
       
        default:
            return Color(.systemGray3)
            
//            return ColorManager.pmbc_blue
            
        }
    }
    
    
    
    private func chatButtonTapped() {
        if newGroupMembers.count > 0 {
            for newId in newGroupMembers {
                for f in homeData!.friends {
                    if f.id == newId {
                        //MARK: Sending push notification to friend "f"
                        RestApi.instance.sendPushNotification(title: "BestFriends", body: homeData!.user.firstName + " " +  String(homeData!.user.lastName.first!) + "wants to talk in Chat", APNToken: f.APNToken )
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
            
            
            
        }
    }
    
}


