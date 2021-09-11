
class LoginInspector: LoginViewControllerDelegate {
    
    func loginInspectorCheck(enteredLogin: String, enteredPswd: String) -> Bool {
        return Checker.shared.loginCheck(enteredLogin: enteredLogin, enteredPswd: enteredPswd)
    }
}
