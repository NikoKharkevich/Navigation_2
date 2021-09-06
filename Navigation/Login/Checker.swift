
class Checker {
    
    private let login = "Dave"
    private let pswd = "pass"
    
    func loginCheck(enteredLogin: String, enteredPswd: String) -> Bool {
        if enteredLogin == login && enteredPswd == pswd {
            return true
        } else {
            return false
        }
    }
}
