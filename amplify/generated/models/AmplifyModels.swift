// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "a2e247c976fe19476b4086ca7fd138d9"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Room.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Notification.self)
  }
}