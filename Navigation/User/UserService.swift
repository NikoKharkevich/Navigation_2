
import Foundation
import StorageService

protocol UserService {
    func userService(userName: String) -> User?
}
