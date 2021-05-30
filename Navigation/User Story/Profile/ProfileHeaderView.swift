//
//  ProfileHeaderSwift.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 19.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    var view: UIView
    
    private var statusText: String = ""
  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        
        setStatusButton.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray

        
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.text = "My Name..."
        
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
      
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UITextField!
    
    @IBOutlet weak var setStatusButton: UIButton!
    @IBAction func setStatusButton(_ sender: UIButton) {
        statusLabel.text = statusTextField.text
    }
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusTextField: UITextField!
    
    @objc func statusTextChanged() {
        statusText = statusTextField.text!
    }

    }
