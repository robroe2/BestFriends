//
//  ShakingCoolView.swift
//  BestFriends
//
//  Created by Alex Titov on 5/24/21.
//

import SwiftUI
import Amplify
import PhotosUI

struct ShakingCoolView: View {
    
    @State private var shakingCool: [ShakingCool] = []
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var availableIDs: [String] = []
    @State private var availableNames: [String] = []
    @State private var chosenID = ""
    @State private var choosingRecipient = false
    @State private var myid = ""
    @State private var needToLoad = true
    @State private var isAdPresented = false
    @State private var images: [UIImage] = []
    @State private var currentlyLoading = false
    
    @EnvironmentObject var sessionManager: SessionManager
    
    private var shakingCoolDataSource = ImageDataSource()
    
    var body: some View {
        ZStack {
            Image("blueBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.global(qos: .userInitiated).async {
                        reloadData()
                    }
                }
            
            VStack {
                Text("You can add \(howManyLeft()) more image(s)")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.system(size: 20, weight: .thin))
                
                ScrollView(showsIndicators: false) {
                    ForEach(images.indices, id: \.self) { index in
                        let name = shakingCool[index].intendedid == myid ? "Myself" : shakingCool[index].intendedname
                        VStack {
                            Text(name)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .light))
                                .padding()
                            
                            Image(uiImage: images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(30)
                                .onTapGesture {
                                    DispatchQueue.global(qos: .userInitiated).async {
                                        chosenID = shakingCool[index].id
                                        shakingCoolDataSource.deleteImage(id: shakingCool[index].link)
                                        reloadData()
                                    }
                                }
                        }
                    }
                }
                //                    .frame(height: 350)
                
                
                Text("Tap image to delete")
                    .italic()
                    .font(.system(size: 20, weight: .thin))
                    .foregroundColor(.white)
                    .fullScreenCover(isPresented: $isAdPresented, content: ShakingCoolAdView.init)
                
                
                if availableIDs.count > 0 {
                    Text("Add Image")
                        .frame(width: 150, height: 50, alignment: .center)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(.title)
                        .background(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                        .cornerRadius(25)
                        .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                        .onTapGesture {
                            choosingRecipient.toggle()
                        }
                        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                            ImagePicker(image: self.$inputImage, sourceType: .photoLibrary)
                        }
                        .padding()
                }
                
                Text("Return")
                    .frame(width: 150, height: 50, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .font(.title)
                    .background(ColorManager.purple4)
                    .cornerRadius(25)
                    .shadow(color: Color(#colorLiteral(red: 0.2067186236, green: 0.2054963708, blue: 0.2076624334, alpha: 1)), radius: 2, x: 0, y: 2)
                    .onTapGesture {
                        AnalyticsDataSource().recordShakingCoolDepartureEvent()
                        isAdPresented = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10.8) {
                            sessionManager.showHideouts()
                        }
                    }
                    .padding()
            }
            
            if currentlyLoading {
                Text("Uploading image...")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 200)
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .cornerRadius(25)
                    .transition(.scale)
            }
            
            if choosingRecipient {
                VStack {
                    ForEach(availableIDs.indices, id: \.self) { index in
                        Button(action: {
                            let photos = PHPhotoLibrary.authorizationStatus()
                            if photos == .notDetermined {
                                PHPhotoLibrary.requestAuthorization({status in
                                    if status == .authorized{
                                        chosenID = availableIDs[index]
                                        showingImagePicker = true
                                        choosingRecipient = false
                                    } else {}
                                })
                            } else {
                                chosenID = availableIDs[index]
                                showingImagePicker = true
                                choosingRecipient = false
                            }
                        }) {
                            Text(availableNames[index])
                                .frame(width: 150, height: 50, alignment: .center)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.title)
                                .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                                .cornerRadius(25)
                                .padding()
                        }
                    }
                }
            }
        }
    }
    
    private func loadImage() {
        DispatchQueue.global(qos: .userInitiated).async {
            withAnimation {
                showingImagePicker = false
                choosingRecipient = false
                currentlyLoading = true
            }
            
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1.0) {
                
                guard let inputImage = inputImage else { return }
                print("Got the image")
                let state = ImageDataSource().uploadImageToShakingCool(image: inputImage, targetID: chosenID)
                withAnimation {
                    currentlyLoading = false
                }
                if state == true {
                    sleep(1)
                    reloadData()
                }
            }
        }
    }
    
    private func reloadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            print("reloading Shaking cool")
            let userDS = UserDataSource()
            let user = userDS.getCurrentUser()
            myid = user.id
            print("Got user: ", user)
            shakingCool = []
            images = []
            availableNames = []
            availableIDs = []
            shakingCool = user.shakingCool
            print("Shaking Cool: ", shakingCool)
            chosenID = user.id
            var mycounter = 0
            availableIDs = user.friends
            for cool in shakingCool {
                if cool.intendedid == user.id {
                    mycounter += 1
                }
                if let index = availableIDs.firstIndex(of: cool.intendedid) {
                    availableIDs.remove(at: index)
                }
            }
            for id in availableIDs {
                availableNames.append(userDS.getUser(id: id).firstName)
            }
            if mycounter < 2 {
                availableIDs.insert(user.id, at: 0)
                availableNames.insert("Myself", at: 0)
                print("Added self")
            }
            for cool in shakingCool {
                images.append(shakingCoolDataSource.downloadImage(key: cool.link, rotating: true, tall: false))
            }
        }
    }
    
    private func howManyLeft() -> Int {
        let user = UserDataSource().getCurrentUser()
        let first = user.friends.count
        let second = user.shakingCool.count
        return 2 + first - second
    }
}
