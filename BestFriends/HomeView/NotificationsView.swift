//
//  NotificationsView.swift
//  BestFriends
//
//  Created by Alex Titov on 4/17/23.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var ians: [InAppNotification] = []
    
    let user: User
    let friend: User
    let friends: [User]
    let groups: [Group]
    let atmosphere: Atmosphere
    
    //   *********************** color change tapped
    
    
    
    @State private var shareColor = ColorManager.grey3
    @State private var colorChangeTap: String = ""
    @State private var shareTapped: Bool = false
    @State private var colors: [Color] = [Color.cyan]
    
    //    ********************************
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.9)
                    .onAppear(perform: getNotifications)
            
                
                AdPlayerView(name: "sky2")
                    .ignoresSafeArea()
                    .blendMode(.screen)
                    .opacity(0.9)
                
                
             
                
            VStack {
                    Text("Notifications")
                        .font(.system(size: 20, weight: .thin))
                        .foregroundColor(.white)
                        .padding()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(ians, id: \.createdOn) { ian in
                            NotificationBubble(ian: ian, user: user, friends: friends, groups: groups)
                                .opacity(0.7)
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    Text("Return")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(.white)
                        .padding()
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }
        }
    }
    
    private func getNotifications() {
        RestApi.instance.getInAppNotifications().then({ data in
            ians = data
            ians.sort { $0.createdOn > $1.createdOn }
            print("Increased IANs to ", data.count)
        })
    }
    
    private struct NotificationBubble: View {
        let user: User
        let friends: [User]
        let groups: [Group]
        
        
        let ian: InAppNotification
        var t: String
        
        
        @State private var photoPopActive = false
        @State private var hugActive = false
        @State private var thanksHugActive = false
        @State private var kissesActive = false
        @State private var thanksKissesActive = false
        @State private var heartsActive = false
        @State private var thanksHeartActive = false
        @State private var songActive = false
        @State private var thanksSongActive = false
        @State private var fixFightActive = false
        @State private var talkCouponActive = false
        @State private var newVibeActive = false
        @State private var needTalkActive = false
        @State private var newCustomActive = false
        @State private var thanksCustomActive = false
        @State private var newCongratulationsActive = false
        @State private var thanksCongratulationsActive = false
        @State private var meetupCouponActive = false
        @State private var fistPumpActive = false
        @State private var newMusicActive = false
        @State private var lookNiceActive = false
        @State private var canDoActive = false
        @State private var thanksDoActive = false
        @State private var affirmationActive = false
        @State private var photoPOPActive = false
        @State private var thanksAffirmationActive = false
        @State private var sorryActive = false
        @State private var missingYouActive = false
        
        
        
        init(ian: InAppNotification, user: User, friends: [User], groups: [Group]) {
            self.ian = ian
            self.user = user
            self.friends = friends
            self.groups = groups
            
            
            let date = Date()
            let ti = date.timeIntervalSince1970
            var dif = Int64(ti)
            dif -= ian.createdOn
            var s = String(dif)
            self.t = String(s + " seconds ago")
            
            if (dif > 60) {
                dif = dif / 60
                s = String(dif)
                self.t = String(s + " minutes ago")
            }
            
            if (dif > 60) {
                dif = dif / 60
                s = String(dif)
                self.t = String(s + " hours ago")
            }
            
            if (dif > 24) {
                dif = dif / 24
                s = String(dif)
                self.t = String(s + " days ago")
            }
        }
        
        var body: some View {
            
            
            
            ZStack {
                
                VStack {
                    
//   **************** NOT USING THESE PAGES ***********************
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $missingYouActive, label: {
                        EmptyView()
                    })
                   
//        ********************************************
                    
             
                    
                    
                    
                    
//                  DONE _ DONE _ DONE
                    NavigationLink(destination: PhotoPopView(user: user, friends: friends), isActive: $photoPopActive, label: {
                        EmptyView()
                    })
                    

                    
                    
                    
                    
//                  DONE _ DONE _ DONE
                    NavigationLink(destination: CH9(user: user, friends: friends), isActive: $kissesActive, label: {
                        EmptyView()
                    })
//********************* QUESTION: do we need to link the thank you to anything? ****
                    NavigationLink(destination: CH9(user: user, friends: friends), isActive: $thanksKissesActive, label: {
                        EmptyView()
                    })
                    
                  
                    
                    
                    
                    
//                  DONE _ DONE _ DONE
                    NavigationLink(destination: VirtualHug(user: user, friends: friends), isActive: $hugActive, label: {
                        EmptyView()
                    })
    //********************* QUESTION: do we need to link the thank you to anything? ****
                    NavigationLink(destination: VirtualHug(user: user, friends: friends), isActive: $thanksHugActive, label: {
                        EmptyView()
                    })
                    
                    
                    
                    
                    
                    
                    
                    
//      ******************************** push notifiction link to received Congrats
//                    RR14(user: user, friend: user, friends: friends, groups: groups)
                    //    ********************************************
                    NavigationLink(destination: RR14(user: user, friend: user, friends: friends, groups: groups), isActive: $newCongratulationsActive, label: {
                        EmptyView()
                    })
                    
//********************* QUESTION: do we need to link the thank you to anything? ****
//                    NavigationLink(destination: RR14(user: user, friend: user, friends: friends, groups: groups), isActive: $thanksCongratulationsActive, label: {
//                        EmptyView()
//                    })
                    
                    
                    
                    
                    
                    
                    
                    
                    
               
                    
                    
    //      ******************************** push notifiction link to received
//                    CH7(user: user, friend: user, friends: friends, groups: groups)
    //    ********************************************
                    NavigationLink(destination: CH7(user: user, friend: user, friends: friends, groups: groups), isActive: $songActive, label: {
                        EmptyView()
                    })
                  
    }
                
                //********************* QUESTION: do we need to link the thank you to anything? ****
                NavigationLink(destination: CH7(user: user, friend: user, friends: friends, groups: groups), isActive: $thanksSongActive, label: {
                    EmptyView()
                })
                
                
                
                
                
                
                
                
//      ******************************** push notifiction link to received
//                RR13(user: user, friends: friends, groups: groups)
    //    ********************************************
                NavigationLink(destination: RR13(user: user, friends: friends, groups: groups), isActive: $heartsActive, label: {
                    EmptyView()
                })
                
                
                
//               ********************** Message goes to Chat **************************
//********************* QUESTION: do we need to link the thank you to anything? ****
                NavigationLink(destination: RR13(user: user, friends: friends, groups: groups), isActive: $thanksHeartActive, label: {
                    EmptyView()
                })
                
             
               
                
                
                
                
                VStack {
//   **************** NOT USING THESE PAGES ***********************
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $fixFightActive, label: {
                        EmptyView()
                    })
                    
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $talkCouponActive, label: {
                        EmptyView()
                    })
//****************************
                    
                    
                    
                    
                    
//    ****** Link to homepage **
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $needTalkActive, label: {
                        EmptyView()
                    })
                    
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $newVibeActive, label: {
                        EmptyView()
                    })
//  ********************************
                    
                    
                    
                    
//   **************** Look Nice ***********************
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $lookNiceActive, label: {
                        EmptyView()
                    })
                    
                    
//                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $thanksNewMusicActive, label: {
//                        EmptyView()
//                    })
//   **********************************************
                    
                    
//                  DONE _ DONE
                    NavigationLink(destination: RR29(user: user, friends: friends), isActive: $canDoActive, label: {
                        EmptyView()
                    })
//********************* QUESTION: do we need to link the thank you to anything? ****
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $thanksDoActive, label: {
                        EmptyView()
                    })
                    
                    
                    
                    
                    
                    
                    
//      ******************************** PAGE NOT BUILT YET **
//                RR13(user: user, friends: friends, groups: groups)
    //    ********************************************
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $affirmationActive, label: {
                        EmptyView()
                    })
                    
        }
                
VStack {
                  
    //********************* QUESTION: do we need to link the thank you to anything? ****
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $thanksAffirmationActive, label: {
                        EmptyView()
                    })
                    
 
    
    
    
    //      ******************************** PAGE NOT BUILT YET **
                    NavigationLink(destination: SaySomethingNice5(user: user, friends: friends), isActive: $sorryActive, label: {
                        EmptyView()
                    })
                    
            
    }
                
               
                
                
                    
                    
                  
                    
                 
                
                    
                    
                    
                    
                    
                    
                    Color.cyan
                    
                    //                .background(Color(.systemPurple), : ColorManager .cyan)
                    
                    VStack {
                        
                        Text(ian.text)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal, 5)
                        
                        
                        
                        HStack {
                            Text(ian.sender)
                                .font(.system(size: 12, weight: .light))
                            
                            Spacer()
                            
                            Text(t)
                                .font(.system(size: 12, weight: .light))
                        }
                        .padding(.horizontal, 5)
                    }
                }
                .frame(height: 60)
                .cornerRadius(15)
                .onTapGesture(perform: tapped)
                
            }
            
            
            
            private func tapped() {
                switch ian.text {
                    
                    
// *********** What are you doing / PhotoPOP?
                case "What are you doing? Send PhotoPoP!":
                    photoPopActive = true
                    
                case "Sent you a photoPOP - 'shake' your iPhone":
                    photoPOPActive = true
                    
                    
                    
                    // *********** VIBE **********************************
// *********** Day Changed
                case "changed their vibe. Could you check on them. Your true friendship is priceless.":
                    newVibeActive = true
                    
// *********** Need to Talk
                case "I Need to Talk!":
                    needTalkActive = true
                    
                    
                    
                    
                    // *********** CareHearts  **********************************
// *********** Blowing Kisses
                case "You got kisses. Jump up high and catch them - TAP":
                    kissesActive = true
                    
                case "Ahhh! Thanks for the Kisses!":
                    thanksKissesActive = true
                   

// *********** Love / Hearts
                case "You got Love Tarts (check Chat) - TAP":
                    heartsActive = true
                    
                case "said thanks for thinking about them and sending Hearts!":
                    thanksHeartActive = true
                
                
                    
// *********** Hugs
                case "Aah! ... you just got a hug - TAP":
                    hugActive = true
                    
                case "Ahhh! Thanks for the Hug - it was just what I needed!":
                    thanksHugActive = true
                
                    
// *********** Song
                case "You just got a song (check Chat) - TAP":
                    songActive = true
                    
                case "Thanks, your song really hit the spot!":
                    thanksSongActive = true
                    
                    
                    
// *********** Fist-pump
                case "You just got a fist-pump (TAP)":
                    fistPumpActive = true
// ************** No received page for fist-pump **************
                    
                    

                    
                    
// *********** You can do it
                case "You just got a big Thumps-up message in Chat":
                    canDoActive = true
                    
                case "said WOW - thanks for the encouragement!":
                    thanksDoActive = true
                 
                    
                    
// *********** Congratulations
                case "You just received Congratulations. You CRUSHED IT! (check Chat) - TAP":
                    newCongratulationsActive = true
                    
                case "Just said thank you for the Congratulations!!!":
                    thanksCongratulationsActive = true
                    
 
                    
    // *********** Affirmations
                case "said something nice about you in Chat. Long-tap it - save to Keepsake messages. Say something back in Chat":
                    affirmationActive = true
             
                    
                case "said thanks for the kind words":
                    thanksAffirmationActive = true
                    
                    
//     ******************************** System System System  ******************
                    
//                case "said you hurt their feelings and would like to talk":
//                    thanksAffirmationActive = true
                    
                    
               
                    // *********** Fight
// *********** Fight
                case "Just sent you a message in Chat - please look at it":
                    fixFightActive = true
                    
// *********** Fight (Missing You Coupon)
                case "You just got a 'Meetup Coupon' in Chat":
                    missingYouActive = true
               
                
                
                case "Is redeaming ONE 'TalkCoupon'":
                    talkCouponActive = true
             
          
                    
// *********** Say Sorry _____ Not used yet
                                case "said they are sorry":
                                    sorryActive = true
                    
                    
         
// ************************ Look Nice *****************
// *********** Well-being
                case "said you look nice today. Check Chat for a message.":
                    lookNiceActive = true
                    
//                case "Thanks for the song":
//                    thanksNewMusicActive = true
                    
  
                    
                default:
                    return
                    
                    
                }
            }
            
            //        private func defaultMessageButtonTapped(defaultMessage: String) {
            //            self.colorChangeTap = defaultMessage
            
        }
    }


