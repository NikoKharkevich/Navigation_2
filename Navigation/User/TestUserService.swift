
import UIKit

class TestUserService: UserService {
    
    let user = User(userName: "Test", userAvatar: UIImage(named: "doping-test")!, userStatus: "Engine Check")
    
    func userService(userName: String) -> User? {
        
        if userName == user.userName {
            return user
        } else {
        return nil
        }
    }
    
}
