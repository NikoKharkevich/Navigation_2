
class LoginInspector: LoginViewControllerDelegate {
    
    static var loginInspector = LoginInspector()
    
    func loginInspectorCheck(checker: Checker, _enteredLogin: String, _enteredPswd: String) -> Bool {
        return checker.loginCheck(enteredLogin: _enteredLogin, enteredPswd: _enteredPswd)
    }
}
