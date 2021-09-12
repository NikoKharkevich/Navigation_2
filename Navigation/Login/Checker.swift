
class Checker {
    
    private let login = "User"
    private let pswd = "pass"
    
    static var shared = Checker()
    
    private init() { }
    
    func loginCheck(enteredLogin: String, enteredPswd: String) -> Bool {
        return enteredLogin == login && enteredPswd == pswd 
    }
}
