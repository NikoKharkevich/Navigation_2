
import UIKit

class LoginViewController: UIViewController {
    
    private let currentUser = CurrentUserService()
    private let testUser = TestUserService()
    
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupLoginView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    
    func setupLoginView() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(logoVK)
        containerView.addSubview(emailPasswordView)
        emailPasswordView.addSubview(borderView)
        emailPasswordView.addSubview(emailField)
        emailPasswordView.addSubview(passField)
        containerView.addSubview(loginButton)
    }
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
     
    private let logoVK = UIImageView(image: #imageLiteral(resourceName: "VK_logo"))
    
    private let emailPasswordView: UIView = {
        let epView = UIView()
        
        epView.backgroundColor = .systemGray6
        epView.layer.borderColor = UIColor.lightGray.cgColor
        epView.layer.borderWidth = 0.5
        epView.layer.cornerRadius = 10
        
        return epView
    }()
    
    private let borderView: UIView = {
        let border = UIView()
        
        border.layer.borderWidth = 0.5
        border.layer.borderColor = UIColor.lightGray.cgColor
        
        return border
    }()
    
    private let emailField: UITextField = {
        let email = UITextField()
        
        email.textColor = .black
        email.autocapitalizationType = .none
        email.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        email.placeholder = "Email or phone"
        email.tintColor = UIColor(named: "4885CC.png")
        
        return email
    }()
    
    private let passField: UITextField = {
        let pass = UITextField()
        
        pass.textColor = .black
        pass.autocapitalizationType = .none
        pass.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        pass.placeholder = "Password"
        pass.isSecureTextEntry = true
       
        return pass
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "blue_pixel.png")
        button.setBackgroundImage(image, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        if button.isSelected { button.alpha = 0.8 } else
        if button.isHighlighted { button.alpha = 0.8 } else
        if button.isEnabled == false { button.alpha = 0.8 } else {
            button.alpha = 1
        }
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
    
        button.addTarget(self, action: #selector(tapOnLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func tapOnLoginButton() {
        
        #if DEBUG
        if let enteredNamed = emailField.text,
           (testUser.userService(userName: enteredNamed) != nil) {
            let profileVC = ProfileViewController(userService: testUser, enteredUserName: enteredNamed)
            navigationController?.pushViewController(profileVC, animated: true)
            print("Correct login")
        } else {
            print("Wrong login")
        }

        #else
        if let enteredNamed = emailField.text,
           delegate?.loginInspectorCheck(enteredLogin: emailField.text ?? "", enteredPswd: passField.text ?? "") == true  {
            let profileVC = ProfileViewController(userService: currentUser, enteredUserName: enteredNamed)
            navigationController?.pushViewController(profileVC, animated: true)
            print("Correct!")
        } else {
            print("Wrong login or password")
        }

        #endif

    }
    
//    Switch constraints to snp
    
    func setupConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        logoVK.translatesAutoresizingMaskIntoConstraints = false
        logoVK.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        logoVK.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120).isActive = true
        logoVK.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoVK.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        emailPasswordView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120).isActive = true
        emailPasswordView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        emailPasswordView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        emailPasswordView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.topAnchor.constraint(equalTo: emailPasswordView.topAnchor, constant: 49.75).isActive = true
        borderView.widthAnchor.constraint(equalTo: emailPasswordView.widthAnchor).isActive = true
        borderView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.bottomAnchor.constraint(equalTo: borderView.topAnchor, constant: -1).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 49).isActive = true
        emailField.leftAnchor.constraint(equalTo: emailPasswordView.leftAnchor, constant: 16).isActive = true
        emailField.rightAnchor.constraint(equalTo: emailPasswordView.rightAnchor, constant: -16).isActive = true
        
        passField.translatesAutoresizingMaskIntoConstraints = false
        passField.bottomAnchor.constraint(equalTo: emailPasswordView.bottomAnchor, constant: -1).isActive = true
        passField.heightAnchor.constraint(equalToConstant: 49).isActive = true
        passField.leftAnchor.constraint(equalTo: emailPasswordView.leftAnchor, constant: 16).isActive = true
        passField.rightAnchor.constraint(equalTo: emailPasswordView.rightAnchor, constant: -16).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passField.bottomAnchor, constant: 16).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        loginButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        
    }
    
    
    // MARK: Keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
}


