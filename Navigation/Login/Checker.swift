
class Checker {
    
    private let login = "Dave"
    private let pswd = "pass"
    
    static var shared = Checker()
    
    private init() { }
    
    func loginCheck(enteredLogin: String, enteredPswd: String) -> Bool {
        if enteredLogin == login && enteredPswd == pswd {
            return true
        } else {
            return false
        }
    }
}
