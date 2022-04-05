//
//  InviteModels.swift
//  BestFriends
//
//  Created by Alex Titov on 4/4/22.
//

import Foundation

struct Invite: Codable {
    let sender: String
    let recipient: String
    let name: String
    enum CodingKeys: String, CodingKey {
        case sender = "sender"
        case recipient = "recipient"
        case name = "name"
    }
}

struct InviteParams: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct CreateInvite: Codable {
    let recipient: String
    enum CodingKeys: String, CodingKey {
        case recipient = "recipient"
    }
}
