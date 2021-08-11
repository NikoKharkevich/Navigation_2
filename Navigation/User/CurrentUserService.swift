
import UIKit
import StorageService

class CurrentUserService: UserService {
    
    let user = User(userName: "User")
    
    func userService(userName: String) -> User? {
        
        if userName == user.userName {
            return user
        } else {
        return nil
        }
    }
    
}
