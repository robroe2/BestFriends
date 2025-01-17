//
//  DataSource.swift
//  BestFriends
//
//  Created by Alex Titov on 4/17/21.
//

import Amplify
import Foundation

class MessageDataSource: ObservableObject {
    
    @Published var room: Room
    var subscription: GraphQLSubscriptionOperation<Room>?
    
    init(room: Room) {
        self.room = room
    }
    
    func sendMessage(message: Message) {
        room.messages.append(message)
        
        Amplify.API.mutate(request: .update(room)) { [weak self] mutationResult in
            switch mutationResult {
            case .success(let creationResult):
                
                switch creationResult {
                case .success:
                    print("Successfully sent a message", message)
                    self!.room.timeUpdated = Int(Date().timeIntervalSince1970)
                    RoomDataSource().updateRoom(room: self!.room)
                case .failure(let error):
                    print("Message sending error: ", error)
                }
                
            case .failure(let apiError):
                print("Message sending api error: ", apiError)
            }
        }
    }
    
    func saveToSmileNotes(message: Message) {
        guard let userid = Amplify.Auth.getCurrentUser()?.username else {return}
        let smileNote = SmileNote(id: Helper().randomString(length: 20), message: message, favorite: false)
        var user = UserDataSource().getUser(id: userid)
        var smileNotes: [SmileNote] = user.smileNotes
        smileNotes.append(smileNote)
        user.smileNotes = smileNotes
        Amplify.API.mutate(request: .update(user)) { mutationResult in
            switch mutationResult {
            case .success(let creationResult):
                
                switch creationResult {
                case .success:
                    print("Successfully saved a message to Smile Notes", message)
                    
                case .failure(let error):
                    print("Message saving to Smile Notes error: ", error)
                }
                
            case .failure(let apiError):
                print("Message sending api error: ", apiError)
            }
        }
    }
    
    func likeMessage(message: Message, theroom: Room) {
        var updatedroom = theroom
        
        for index in 0..<updatedroom.messages.count {
            print(updatedroom.messages[index].hasBeenLiked)
            if updatedroom.messages[index].id == message.id && message.hasBeenLiked == false {
                updatedroom.messages[index].hasBeenLiked = true
                print("Updating")
                let group = DispatchGroup()
                group.enter()
                
                Amplify.API.mutate(request: .update(updatedroom)) { event in  //update updatedroom
                    switch event {
                    case .success(let result):
                        switch result {
                        case .success(let updatedroom):
                            print("Successfully updated updatedroom: \(updatedroom)")
                            group.leave()
                        case .failure(let error):
                            print("Got failed result with \(error.errorDescription)")
                        }
                    case .failure(let error):
                        print("Got failed event with error \(error)")
                    }
                }
                
                group.wait()
                return
            }
        }
        
        return
    }
    
    func thumbsUpMessage(message: Message, theroom: Room) {
        var updatedroom = theroom
        
        for index in 0..<updatedroom.messages.count {
            print(updatedroom.messages[index].hasBeenLiked)
            if updatedroom.messages[index].id == message.id && message.hasBeenThumb == false {
                updatedroom.messages[index].hasBeenThumb = true
                print("Updating")
                let group = DispatchGroup()
                group.enter()
                
                Amplify.API.mutate(request: .update(updatedroom)) { event in  //update updatedroom
                    switch event {
                    case .success(let result):
                        switch result {
                        case .success(let updatedroom):
                            print("Successfully updated updatedroom: \(updatedroom)")
                            group.leave()
                        case .failure(let error):
                            print("Got failed result with \(error.errorDescription)")
                        }
                    case .failure(let error):
                        print("Got failed event with error \(error)")
                    }
                }
                
                group.wait()
                return
            }
        }
        
        return
    }
    
    func deleteMessage(message: Message) {
        room.messages.removeAll { $0.id == message.id }
        Amplify.API.mutate(request: .update(room)) { mutationResult in
            switch mutationResult {
            case .success(let creationResult):
                
                switch creationResult {
                case .success:
                    print("Successfully deleted a message", message)
                    
                case .failure(let error):
                    print("Message deletion error: ", error)
                }
                
            case .failure(let apiError):
                print("Message deletion api error: ", apiError)
            }
        }
    }
    
    func reportMessage(message: Message) {
        guard let userid = Amplify.Auth.getCurrentUser()?.username else {return}
        let reportedMessage: ReportedMessage = ReportedMessage(reporterID: userid, reportedMessage: message, previousMessages: room.messages)
        Amplify.API.mutate(request: .create(reportedMessage)) { mutationResult in
            switch mutationResult {
                
            case .success(let creationResult):
                
                switch creationResult {
                case .success:
                    print("Successfully reported mesage")
                    
                case .failure(let error):
                    print("Failed to report message: ", error)
                }
                
            case .failure(let apiError):
                print("Report message api error: ", apiError)
            }
        }
    }
    
    func createSubscription() {
        subscription = Amplify.API.subscribe(request: .subscription(of: Room.self, type: .onUpdate), valueListener: { (subscriptionEvent) in
            switch subscriptionEvent {
            case .connection(let subscriptionConnectionState):
                print("Subscription connect state is \(subscriptionConnectionState)")
            case .data(let result):
                switch result {
                case .success(let updatedRoom):
                    print("Successfully got the updated room from subscription: \(updatedRoom)")
                    if updatedRoom.id == self.room.id {
                        self.room = updatedRoom
                        print("Updated room: ", self.room)
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            }
        }) { result in
            switch result {
            case .success:
                print("Subscription has been closed successfully")
            case .failure(let apiError):
                print("Subscription has terminated with \(apiError)")
            }
        }
    }
    
    func uploadImage(image: UIImage) {
        guard let userID = Amplify.Auth.getCurrentUser()?.username else { return }
        let user = UserDataSource().getUser(id: userID)
        let data = image.pngData()!
        let key = "Image/" + Helper().randomString(length: 20)
        Amplify.Storage.uploadData(key: key, data: data,
                                   progressListener: { progress in
            print("Progress: \(progress)")
        }, resultListener: { (event) in
            switch event {
            case .success(let data):
                print("Completed: \(data)")
                self.sendMessage(message: Message(id: Helper().randomString(length: 20), senderName: user.firstName, senderID: user.id, body: "*Image*", creationDate: Int(NSDate().timeIntervalSince1970), attachmentPath: key, hasBeenLiked: false, hasBeenThumb: false))
            case .failure(let storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        })
    }
    
    func downloadImage(key: String) -> UIImage {
        var image = UIImage()
        
        let group = DispatchGroup()
        group.enter()
        
        Amplify.Storage.downloadData(
            key: key,
            progressListener: { progress in
                print("Progress: \(progress)")
            }, resultListener: { (event) in
                switch event {
                case let .success(data):
                    print("Completed: \(data)")
                    //data downloaded
                    image = UIImage(data: data) ?? UIImage()
                    group.leave()
                    
                case let .failure(storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                }
            })
        
        group.wait()
        
        return image
    }
    
    
}







//    @Published var messages = [Message]()
//
//    func send(_ message: Message) {
//        Amplify.API.mutate(request: .create(message)) { [weak self] mutationResult in
//            switch mutationResult {
//
//            case .success(let creationResult):
//
//                switch creationResult {
//                case .success:
//                    print("Successfully created message")
//
//                case .failure(let error):
//                    print(error)
//                }
//
//            case .failure(let apiError):
//                print(apiError)
//            }
//        }
//    }
//
//    func getMessages() {
//        Amplify.API.query(request: .list(Message.self)) { [weak self] result in
//            do {
//                let messages = try result.get().get()
//
//                DispatchQueue.main.async {
//                    self?.messages = messages.sorted(by: { $0.creationDate < $1.creationDate})
//                }
//            } catch {
//                print("Error getting messages: ", error)
//            }
//        }
//    }
//
//
//    func delete(_ message: Message) {
//        Amplify.API.mutate(request: .delete(message)) { result in
//            print(result)
//        }
//    }
//
//
//    var subscription: GraphQLSubscriptionOperation<Message>?
//
//    func observeMessages() {
//        subscription = Amplify.API.subscribe(
//            request: .subscription(of: Message.self, type: .onCreate),
//
//            valueListener: { [weak self] subscriptionEvent in
//                switch subscriptionEvent {
//                case .connection(let connectionState):
//                    print("connection state:", connectionState)
//
//                case .data(let dataResult):
//                    do {
//                        let message = try dataResult.get()
//
//                        DispatchQueue.main.async {
//                            self?.messages.append(message)
//                        }
//                    } catch {
//                        print(error)
//                    }
//                }
//             },
//             completionListener: { completion in
//                print(completion)
//             }
//        )
//    }
//
//
