//
//  AtmosphereMain2.swift
//  BestFriends
//
//  Created by Social Tech on 5/12/22.
//


import Combine
import SwiftUI
import ConfettiSwiftUI
import AVKit


struct AtmosphereMain2: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: User
    let atmosphere: Atmosphere
    let friends: [User]
    
    
//    let user: User
//    let atmosphere: Atmosphere
//    let friends: [User]
    let friendAtmospheres: [Atmosphere]
    let groups: [Group]
    
    @State private var mood: Int = -1
    @State private var summary = ""
    @State private var sharedWith: [String] = []
    @State private var colorChangeTap: String = ""
    @State private var shareTapped: Bool = false
    @State private var selectedFriends: [String] = []
    @State private var shareColor = ColorManager.purple5
    @State private var showingAlert = false
    @State private var colors: [Color] = [ColorManager.purple3, ColorManager.purple3, ColorManager.purple3, ColorManager.purple3, ColorManager.purple3]
  
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            
//
//            if shareTapped {
//
//                ColorManager.purple3
//                    .ignoresSafeArea()
//                    .onAppear()
////                Image("purpleBackground")
////                    .resizable()
////                    .ignoresSafeArea()
////                    .scaledToFill()
////                    .ignoresSafeArea()
//
//                AdPlayerView(name: "sky2")
//                    .ignoresSafeArea()
//                    .blendMode(.screen)
//            } else {
//                AdPlayerView(name: "")
//                    .ignoresSafeArea()
//                    .blendMode(.screen)
//
//                ColorManager.purple1
//                    .ignoresSafeArea()
//            }
            
            
            
            ColorManager .purple3
                .ignoresSafeArea()
              .onAppear()

//            Color .black
//                .ignoresSafeArea()

        
            AdPlayerView(name: "sky2")
                .ignoresSafeArea()
            
            
            VStack {
       
                
                HStack {
                    
                    
                    Text("Alert \nSeverity")
                        .font(.system(size: 30))
                        .fontWeight(.ultraLight)
                        .foregroundColor(ColorManager .grey1)
                        .multilineTextAlignment(.center)
                    
                    Image("FatGuy200")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                }
           
                HStack {
                    VStack {
                        
                        
                        
                        Button(action: {
                            mood = 0
                        }) {
                            
                            Text("Just letting \nyou know \nsomething \nhappened \n\nNeed little \ntime alone first \nbefore talking")
                                .font(.system(size: 10))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 120, alignment: .center)
                        .background(mood == 0 ? Color(.cyan) : ColorManager .purple3)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
//                        Spacer()
//                            .frame(height: 12)
//
//                        Button(action: {
//                            mood = 1
//                        }) {
//
//                            Text("Dented Heart")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 1 ? Color(.cyan) : ColorManager .purple3)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//
//                        Spacer()
//                            .frame(height: 12)
////
////                        Button(action: {
////                            mood = 2
////                        }) {
////
////                            Text("Family \nIssues")
////                                .font(.system(size: 10))
////                                .foregroundColor(Color.black)
////                        }
////                        .frame(width: 80, height: 30, alignment: .center)
////                        .background(mood == 2 ? Color(.cyan) : ColorManager .pmbc_blue)
////                        .cornerRadius(7)
////                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
////
////
////                        Spacer()
////                            .frame(height: 12)
//
//                        Button(action: {
//                            mood = 3
//                        }) {
//
//                            Text("Sad \nLonely")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 3 ? Color(.cyan) : ColorManager .purple3)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
                    }
                    
                    Spacer()
                        .frame(width: 20)
                    
                    VStack {
                        
//                        Text("Sad Vibe shows as blue \natmospere around your \nplanet, happy vibe \nas yellow")
//                            .font(.system(size: 13))
//                            .fontWeight(.ultraLight)
//                            .foregroundColor(ColorManager .grey4)
//                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        
                        ZStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(ColorManager .purple1)
                            .frame(width: 100, height: 80)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                            .opacity(0.95)
                        
                        
                        NavigationLink(
                            destination: MyRoomInfo(user: user, atmosphere: atmosphere, friends: friends, friendAtmospheres: friendAtmospheres, groups: groups),
                            label: {
                                Text("Please send \nCare Heart")
                                    .fontWeight(.thin)
                                    .frame(width: 70, height: 37)
                                    .foregroundColor(ColorManager .purple7)
                                    .font(.system(size: 12))
                                    .background(ColorManager .purple1)
                                    .cornerRadius(10)
                                    .opacity(0.95)
                            })
                    }
                        
                    }
                    
                    
                    
                    
                    
                    
                    
//                        Button(action: {
//                            mood = 4
//                        }) {
//
//                            Text("My Exciting \nNEWS!")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 4 ? Color(.systemGreen) : Color .yellow)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//
//                        Spacer()
//                            .frame(height: 12)
//
//                        Button(action: {
//                            mood = 5
//                        }) {
//
//                            Text("I was really \nhoping that...")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 5 ? Color(.systemOrange) : ColorManager .orange1)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//
//
//                    }
//
                    Spacer()
                        .frame(width: 20)
                    
                    VStack {
                        
                        Button(action: {
                            mood = 6
                        }) {
                            
                            Text("Need to talk \nNOW!")
                                .font(.system(size: 10))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 120, alignment: .center)
                        .background(mood == 6 ? Color(.systemYellow) : ColorManager .orange4)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 12)
//
//                        Button(action: {
//                            mood = 7
//                        }) {
//
//                            Text("Happy \nToday")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 7 ? Color(.systemYellow) : ColorManager .orange2)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//
//                        Spacer()
//                            .frame(height: 12)
                        
//                        Button(action: {
//                            mood = 8
//                        }) {
//
//                            Text("Found \nNEW Music")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 8 ? Color(.systemYellow) : ColorManager .pmbc_green)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
//
//                        Spacer()
//                            .frame(height: 12)
//
//                        Button(action: {
//                            mood = 9
//                        }) {
//
//                            Text("Exciting News")
//                                .font(.system(size: 10))
//                                .foregroundColor(Color.black)
//                        }
//                        .frame(width: 80, height: 30, alignment: .center)
//                        .background(mood == 9 ? Color(.systemYellow) : ColorManager .orange2)
//                        .cornerRadius(7)
//                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//
                    }
                }
                
                
                VStack {
                    // MARK: End of feeling buttons
                    
                    
                    HStack {
                        
                        
                        
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    ZStack {
                        Rectangle()
                            .frame(width:335, height: 35)
                            .cornerRadius(10)
                            .foregroundColor(ColorManager .grey3)
//                            .backgroundColor(ColorManager .grey3)
                            .opacity(0.5)
                        
                        TextField("(What's up? Start your chat thread ...", text: $summary)
                            .font(.system(size: 17))
                            .foregroundColor(ColorManager.grey1)
                            .padding(.horizontal, 55)
                            .onReceive(Just(summary)) { _ in limitText(45) }
                        
                        
                    }
                    
                    
                    HStack {
                        
                    }
                    
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        
                        HStack {
                            
                            //                            Text("select >")
                            //                                .fontWeight(.thin)
                            //                                .frame(width: 100, height: 30)
                            //                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            //                                .font(.system(size: 20))
                            //                                .background(Color(hue: 0.555, saturation: 1.0, brightness: 0.845))
                            //                                .cornerRadius(25)
                            //                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                            
                            
                            if friends.count > 0 {
                                RectView(user: user, friend: friends[0], color: colors[0])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[0].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[0].id }
                                            colors[0] = ColorManager.purple3
                                        } else {
                                            selectedFriends.append(friends[0].id)
                                            colors[0] = ColorManager.purple5
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                            
                            if friends.count > 1 {
                                RectView(user: user, friend: friends[1], color: colors[1])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[1].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[1].id }
                                            colors[1] = ColorManager.purple3
                                        } else {
                                            selectedFriends.append(friends[1].id)
                                            colors[1] = ColorManager.purple5
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                        }
                        
                        //                        Spacer()
                        //                            .frame(height: 15)
                        
                        HStack {
                            if friends.count > 2 {
                                RectView(user: user, friend: friends[2], color: colors[2])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[2].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[2].id }
                                            colors[2] = ColorManager.purple3
                                        } else {
                                            selectedFriends.append(friends[2].id)
                                            colors[2] = ColorManager.purple5
                                        }
                                        print(selectedFriends)
                                    })
                            }
                            
                            if friends.count > 3 {
                                RectView(user: user, friend: friends[3], color: colors[3])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[3].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[3].id }
                                            colors[3] = ColorManager.purple3
                                        } else {
                                            selectedFriends.append(friends[3].id)
                                            colors[3] = ColorManager.purple5
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                            
                            if friends.count > 4 {
                                RectView(user: user, friend: friends[4], color: colors[4])
                                    .onTapGesture(perform: {
                                        if selectedFriends.contains(friends[4].id) {
                                            selectedFriends = selectedFriends.filter { $0 != friends[4].id }
                                            colors[4] = ColorManager.purple3
                                        } else {
                                            selectedFriends.append(friends[4].id)
                                            colors[4] = ColorManager.purple5
                                        }
                                        print(selectedFriends)
                                    })
                                
                            }
                        }
                        
                        Spacer()
                            .frame(height: 15)
                        
                        
                        Button(action: {
                            counter += 1
                            shareTapped = true
                            shareButtonTapped()
                        },
                               label: {
                            Text("SHARE")
                                .fontWeight(.thin)
                                .frame(width: 100, height: 30)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 25))
                                .background(shareColor)
                                .cornerRadius(15)
                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                                .alert("friends will get push notification - \n\n'Blue' atmospher around your planet tells them \nyou need some time first \n\n'Yellow' means you want to talk now", isPresented: $showingAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                            
                        })
                        .confettiCannon(counter: $counter)
                        
                        Spacer()
                            .frame(height: 25)
                        
//
                        Button(action: {
                            sessionManager.showLogin()
                        },
                            label: {
                            Image("home-alt2")
                                .frame(width: 50, height: 25)
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .background(Color .black)
                                .cornerRadius(15)
                                .shadow(color: Color(.gray), radius: 1, x: 0, y: 2.5)
                                .opacity(0.70)
                            
                        })
//                        NavigationLink(
//                            destination: Impetus(user: user),
//                            label: {
//                                Text("'story like' feature (Q:3 2023)")
//                                    .fontWeight(.thin)
//                                    .frame(width: 245, height: 30)
////                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                    .foregroundColor(Color .black)
//                                    .font(.system(size: 17))
//                                    .background(ColorManager.pmbc_green)
//                                    .cornerRadius(10)
//                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
//                                    .opacity(0.8)
//                            })
//                        

                            VStack {

                                Spacer()
                                    .frame(height: 25)

                        }
                        
                    }
                    
                }
                
                Spacer()
                    .frame(height: 80)
                
            }
        }
    }
    
    func shareButtonTapped() {
        shareMood()
        
        if selectedFriends.count == 0 { return }
        for id in selectedFriends {
            for f in friends {
                if f.id == id {
                    RestApi.instance.sendPushNotification(title: "BestFriends", body: "Something happened to \(user.firstName) changing their 'Vibe'. Please check on them. ", APNToken: f.APNToken)
                }
            }
        }
        shareColor = ColorManager.darkGrey
        showingAlert = true
        
    }
    
    private func shareMood() {
        RestApi.instance.createMoodLog(mood: mood, summary: summary, friends: sharedWith).then({ moodLog in
            print("Got mood log: ", moodLog)
            var m = atmosphere.moodLogs ?? []
            m.append(moodLog.id)
            let atm = Atmosphere(id: atmosphere.id, planet: atmosphere.planet, mood: mood, moodLogs: m)
            RestApi.instance.updateAtmosphere(atmosphere: atm).then({ response in
                if response == 200 {
                    print("Successfully updated atmosphere")
                    for i in sharedWith {
                        for f in friends {
                            if i == f.id {
                                RestApi.instance.sendPushNotification(title: "BestFriends - 'Vibe'", body: "\(user.firstName): Your friend's day just changed! Please take a moment to check on them.", APNToken: f.APNToken )
                            }
                        }
                        mood = -1
                        summary = ""
                        sharedWith = []
                    }
                } else {
                    print("Failed to update atmosphere")
                }
            })
        })
    }
    
    private func limitText(_ upper: Int) {
        if summary.count > upper {
            summary = String(summary.prefix(upper))
        }
    }
    
    
    
    private struct RectView: View {
        let user: User
        let friend: User
        let color: Color
        
        var body: some View {
            Text(friend.firstName + " " + String(friend.lastName.first!))
                .fontWeight(.bold)
                .frame(width: 85, height: 85)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .font(.system(size: 8))
                .background(color)
                .cornerRadius(75)
                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
        }
        
        
        
    }
    
    private func defaultMessageButtonTapped(defaultMessage: String) {
        self.colorChangeTap = defaultMessage
    }
}



