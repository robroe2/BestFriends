//
//  Welcome.swift
//  BestFriends
//
//  Created by Alex Titov on 8/16/21.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        ZStack {
            ColorManager.purple4
                .ignoresSafeArea()
            
            ZStack {
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(ColorManager.signUpCircleColor)
                    .offset(x: 200, y: -400)
                
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(ColorManager.signUpCircleColor)
                    .offset(x: -200, y: -100)
                
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(ColorManager.signUpCircleColor)
                    .offset(x: 150, y: 100)
            }
            
            VStack {
                Spacer()

                Image("Logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaledToFill()
                
                Spacer().frame(height: 300)
                
                Button(action: {
                    sessionManager.showSignUp()
                }) {
                    Text("SIGN UP")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(ColorManager.purple5)
                        .background(ColorManager.grey1)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 30)
                
                Spacer().frame(height: 30)
                
                Button(action: {
                    sessionManager.showLogin()
                }) {
                    Text("LOGIN")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(ColorManager.grey1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 30)
                
                Spacer().frame(height: 30)
            }
            
        }
    }
}

struct WelcomeViewPreview : PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(SessionManager())
    }
}
