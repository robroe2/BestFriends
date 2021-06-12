//
//  AddFriends.swift
//  BestFriends
//
//  Created by Social Tech on 6/12/21.
//



import SwiftUI


struct AddFriends: View {

    var body: some View {
        NavigationView{
            ZStack {
                
                Image("purpleBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack {
                    Text("Adding Friends")
                       
                        .font(.system(size: 40))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 385, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                  
                    
                    Text("You're not on IG or Snap busy amassing connections. BestFriends is about building your team of friends that you trust, confide in and that actually care about you and your happiness.")
                         .italic() .italic()
                         .font(.system(size: 30))
                         .fontWeight(.regular)
                         .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                         .multilineTextAlignment(.center)
                         .frame(width: 385, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                        .frame(height: 35)
                   
                    NavigationLink(
                        destination: SettingsView(),
                        label: {
                            Text("Let's get started")
                        })
                             .frame(width: 325, height: 50)
                             .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                             .overlay(
                                 RoundedRectangle(cornerRadius: 25)
                                     .stroke(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), lineWidth: 1)
                                     )
                    
               
                    
                    Text("Tap 'Add Friends' icon at bottom of Homepage. Text your friend your QR code on your phone.")
                       
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 385, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                      
                  
                    
                    Text("Notes: 1) When a friend adds you send them a pic you want them to put on their ShakingCool. 2) You can be in multiple frind groups.")
                       
                        .font(.system(size: 20))
                        .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 385, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       
                            
                                     Spacer()
                                         .frame(height: 30)
                         
                        }
                    }
                }
            }
        }
            
struct AddFriends_Previews : PreviewProvider {
    static var previews: some View {
        AddFriends()
    }
}

        
