
import UIKit
import StorageService

class CurrentUserService: UserService {
    
    let user = User(userName: "User", userAvatar: UIImage(named: "image8")!, userStatus: "Coding")
    
    func userService(userName: String) -> User? {
        
        if userName == user.userName {
            return user
        } else {
        return nil
        }
    }
    
}
