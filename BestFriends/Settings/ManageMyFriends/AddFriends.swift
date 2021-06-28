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
                
                  
                    Text("* You MUST update your iPhone to 14.5 or higher for QR codes to work.")
                        .italic()
                        .font(.system(size: 20))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 385, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                        .frame(height: 15)
                Text("Adding friends with QR codes ... ")
                    .italic()
                     .font(.system(size: 25))
                     .fontWeight(.regular)
                     .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9791358113, blue: 0, alpha: 1)))
                     .multilineTextAlignment(.center)
                     .frame(width: 385, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                    Text("KEEPS TROLLS OUT!")
                       
                         .font(.system(size: 25))
                         .fontWeight(.regular)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                         .multilineTextAlignment(.center)
                         .frame(width: 385, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(height: 55)
                    VStack {
                        Text("How to Add Friends")
                           
                            .font(.system(size: 45))
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 385, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    HStack {
                    
                    Image("inviteWhite")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .scaledToFill()
                    
                    
                    Text("Tap icon on Homepage.")
                        .italic()
                        .font(.system(size: 27))
                        .fontWeight(.regular)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9791358113, blue: 0, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                      
                    }
                    Text("Step 1.  Select [Get my QR code]")
                        
                         .font(.system(size: 22))
                         .fontWeight(.regular)
                         .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                         .multilineTextAlignment(.center)
                         .frame(width: 375, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Step 2. Screen-shot your QR code and text it to your friend.")
                         
                         .font(.system(size: 22))
                         .fontWeight(.regular)
                         .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                         .multilineTextAlignment(.center)
                         .frame(width: 375, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                    Text("Step 3. Ask friend to save image of your QR code to their gallery.")
                        
                         .font(.system(size: 22))
                         .fontWeight(.regular)
                         .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                         .multilineTextAlignment(.center)
                         .frame(width: 375, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                  
                    Text("Step 4. Ask friend to select [My Gallery] and tap the image of your QR code.")
                        
                         .font(.system(size: 22))
                         .fontWeight(.regular)
                         .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                         .multilineTextAlignment(.center)
                         .frame(width: 375, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   
                    Spacer()
                        .frame(height: 35)
                    
                    NavigationLink(
                        destination: SettingsView(),
                        label: {
                            Text("Ok, got it.")
                        })
                        .font(.system(size: 35))
                        .frame(width: 325, height: 50)
                             .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                             .overlay(
                                 RoundedRectangle(cornerRadius: 25)
                                     .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 1)
                                     )
                    
                   
                 
               
                    Spacer()
                        .frame(height: 55)
               
                 
                         
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

        
}
