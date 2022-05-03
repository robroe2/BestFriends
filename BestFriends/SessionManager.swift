//
//  SessionManager.swift
//  BestFriends
//
//  Created by Alex Titov on 4/16/21.
//
import Foundation

enum AppState {
    case home
    case signUp
    case login
    case invite
    case chat(user: User, group: Group)
    case settings
    case dramaMainView
    case masterFriendVault
    case individualFriendMessages
    case bestFriendMessages
}

final class SessionManager: ObservableObject {
    @Published var appState: AppState = .login

    func showSignUp() {
        appState = .signUp
    }
    
    func showHome() {
        appState = .home
    }
    
    func showLogin() {
        appState = .login
    }
    
    func login(email: String, password: String) {
        RestApi.instance.login(email: email, password: password).then{ tokens in
            print("Tokens: ", tokens)
            self.showHome()
        }.catch { err in
            print("Got error: ", err)
        }
    }
    
    func showInvite() {
        appState = .invite
    }
    
    func showChat(user: User, group: Group) {
        appState = .chat(user: user, group: group)
    }
    
    func showSettings() {
        appState = .settings
    }
    
    func showDramaMainView() {
            appState = .dramaMainView
    }
    
    func showMasterFriendVault() {
        appState = .masterFriendVault
    }

    func showBestFriendMessages() {
            appState = .bestFriendMessages
    }
    func showIndividualFriendMessages() {
            appState = .individualFriendMessages
    }
}
