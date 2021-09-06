
protocol LoginViewControllerDelegate {
    
    func loginInspectorCheck(checker: Checker, _enteredLogin: String, _enteredPswd: String) -> Bool 
    
}
