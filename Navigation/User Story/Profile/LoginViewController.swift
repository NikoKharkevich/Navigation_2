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
        setupLoginView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    private let logoVK: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "VK_logo")
        
        return imageView
        
    }()
    
    func setupLoginView() {
        view.addSubview(logoVK)
        
        let constraints = [
            logoVK.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
}


