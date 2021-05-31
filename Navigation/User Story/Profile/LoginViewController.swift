//
//  LoginViewController.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 31.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupLoginView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureFrames()
    }
    
    
    func setupLoginView() {
        view.addSubview(logoVK)
        view.addSubview(scrollView)
        view.addSubview(emailPasswordView)
        emailPasswordView.addSubview(borderView)
        emailPasswordView.addSubview(emailField)
        emailPasswordView.addSubview(passField)
        
    }
    
    private let logoVK: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "VK_logo"))

        return imageView
        
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
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
    
    func configureFrames() {
        logoVK.translatesAutoresizingMaskIntoConstraints = false
        logoVK.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoVK.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        logoVK.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoVK.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        emailPasswordView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120).isActive = true
        emailPasswordView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        emailPasswordView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
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


