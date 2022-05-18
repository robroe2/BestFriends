//
//  AtmosphereMain2.swift
//  BestFriends
//
//  Created by Social Tech on 5/12/22.
//


import Combine
import SwiftUI


struct AtmosphereMain2: View {
    
    let user: User
    let friends: [User]
    
    @State private var feeling: String = ""
    @State private var customMessage = ""
    
    var body: some View {
        ZStack {
            
            ColorManager.purple3
                .ignoresSafeArea()
                .onAppear()
            //                .onAppear(perform: initLoadData)
            
            VStack {
                HStack {
                    Text("Today I'm Feeling ...")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text("(What is you mood right now?)")
                        .font(.system(size: 15))
                        .italic()
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    VStack {
                        Button(action: {
                            feelingsButtonTapped(feeling: "upset")
                        }) {
                            
                            Text("Upset")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "upset" ? Color.blue : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "stressed")
                        }) {
                            
                            Text("Stressed")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "stressed" ? Color.blue : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "sad")
                        }) {
                            
                            Text("Sad")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "sad" ? Color.blue : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "lonely")
                        }) {
                            
                            Text("Lonely")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "lonely" ? Color.blue : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                    }
                    
                    Spacer()
                        .frame(width: 40)
                    
                    VStack {
                        Button(action: {
                            feelingsButtonTapped(feeling: "okay")
                        }) {
                            
                            Text("Okay")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "okay" ? Color.green : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "bored")
                        }) {
                            
                            Text("Bored")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "bored" ? Color.orange : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        
                    }
                    
                    Spacer()
                        .frame(width: 40)
                    
                    VStack {
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "happy")
                        }) {
                            
                            Text("Happy")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "happy" ? Color.yellow : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "excited")
                        }) {
                            
                            Text("Excited")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "excited" ? Color.yellow : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "powerful")
                        }) {
                            
                            Text("Powerful")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "powerful" ? Color.yellow : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Button(action: {
                            feelingsButtonTapped(feeling: "carefree")
                        }) {
                            
                            Text("Carefree")
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 80, height: 30, alignment: .center)
                        .background(feeling == "carefree" ? Color.yellow : Color.gray)
                        .cornerRadius(7)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        
                        
                    }
                }
                
                
                VStack {
                    // MARK: End of feeling buttons
                    HStack {
                        Text("What's going on?")
                            .font(.system(size: 30))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    
                    ZStack {
                        Rectangle()
                            .frame(width:325, height: 100)
                            .cornerRadius(15)
                            .foregroundColor(Color.white)
                        
                        TextField("You can type your reason here ...", text: $customMessage)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .padding(.horizontal, 50)
                            .onReceive(Just(customMessage)) { _ in limitText(50) }
                        
                        
                    }
                    
                    
                    
                    
                    HStack {
                        Text("Do you want to alert your friends ...")
                            .font(.system(size: 30))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        if friends.count > 1 {
                            Button(action: {
                                
                            },
                                   label: {
                                Text("ALL")
                                    .fontWeight(.bold)
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .font(.system(size: 15))
                                    .background(Color(hue: 0.555, saturation: 1.0, brightness: 0.845))
                                    .cornerRadius(25)
                                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                            })
                        }
                        if friends.count > 0 {
                            RectView(user: user, friend: friends[0])
                        }
                        
                        if friends.count > 1 {
                            RectView(user: user, friend: friends[1])
                        }
                    }
                    
                    HStack {
                        if friends.count > 2 {
                            RectView(user: user, friend: friends[2])
                        }
                        
                        if friends.count > 3 {
                            RectView(user: user, friend: friends[3])
                        }
                        
                        if friends.count > 4 {
                            RectView(user: user, friend: friends[4])
                        }
                    }
                    
                    Button(action: {},
                           label: {
                        Text("SHARE with Friends")
                            .fontWeight(.thin)
                            .frame(width: 250, height: 40)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 30))
                            .background(ColorManager.purple3)
                            .cornerRadius(15)
                            .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                    })
                    .padding()
                    
                    
                    
                    NavigationLink(
                        destination: FriendVaultTrackMoods(),
                        label: {
                            Text("Mood Tracker")
                                .fontWeight(.thin)
                                .frame(width: 200, height: 40)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 30))
                                .background(ColorManager.purple3)
                                .cornerRadius(15)
                                .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        })
             
                    Spacer()
                }
            }
        }
        
        
    }
    
    private func limitText(_ upper: Int) {
        if customMessage.count > upper {
            customMessage = String(customMessage.prefix(upper))
        }
    }
    
    
    
    private struct RectView: View {
        let user: User
        let friend: User
        
        var body: some View {
            Button(action: {
                RestApi.instance.sendPushNotification(title: "BestFriends - Atmosphere", body: "\(user.firstName) Just changed thier Temperament!", APNToken: friend.APNToken ?? "").then { response in
                    print("Got send APN repsonse: ", response)
                    //                RestApi.instance.sendPushNotification(title: "BlueMode", body: "\(user.firstName) invited you to BlueMode!", APNToken: friend.APNToken ?? "").then { response in
                    //                    print("Got send APN repsonse: ", response)
                }
            },
                   label: {
                Text(friend.firstName + " " + String(friend.lastName.first!))
                    .fontWeight(.bold)
                    .frame(width: 100, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.system(size: 10))
                    .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    .cornerRadius(25)
                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
            })
        }
    }
    
    private func feelingsButtonTapped(feeling: String) {
        self.feeling = feeling
    }
}







struct AtmosphereMain2_Previews : PreviewProvider {
    
    static var previews: some View {
        AtmosphereMain2(user: User(id: "", firstName: "", lastName: "", APNToken: "", atmosphere: ""), friends: [])
        
    }
}


