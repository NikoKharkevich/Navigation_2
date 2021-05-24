//
//  ProfileHeaderSwift.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 19.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    
    }
    
    override func layoutSubviews() {
        configureFrames()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(userPicture)
        addSubview(statusButton)
        addSubview(userName)
        addSubview(userStatus)
    }

    private var userPicture: UIImageView = {
        let picture = UIImageView(image: #imageLiteral(resourceName: "Minon (1).jpeg"))
        picture.layer.borderWidth = 3
        picture.layer.borderColor = UIColor.white.cgColor
        picture.clipsToBounds = true

        return picture
    }()
    

    private let statusButton: UIButton = {
        let button = UIButton(type: .system)

        button.frame = CGRect()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4

        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.opacity = 0.7
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)


        return button
    }()
    
    @objc func buttonPressed() {
        print(userStatus.text ?? "no status")
    }
    
    private let userName: UITextField = {
        let name = UITextField()
        
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor = .black
        name.text = "My Name"
        
        return name
    }()
    
    private let userStatus: UITextField = {
        let status = UITextField()
        
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "My Status..."
        
        return status
    }()
    
    func configureFrames() {
        
        userPicture.frame = CGRect(x: self.safeAreaInsets.left + 16,
                                   y: self.safeAreaInsets.top + 16,
                                   width: 110,
                                   height: 110)
        userPicture.layer.cornerRadius = userPicture.frame.size.width / 2
        
        statusButton.frame = CGRect(x: self.safeAreaInsets.left + 16,
                                    y: userPicture.frame.maxY + 16,
                                    width: self.bounds.width - self.safeAreaInsets.left - self.safeAreaInsets.right - 16*2,
                                    height: 50)
        
        userName.frame = CGRect(x: userPicture.frame.maxX + 16,
                                y: self.safeAreaInsets.top + 27,
                                width: 300,
                                height: 50)
        
        userStatus.frame = CGRect(x: userPicture.frame.maxX + 16,
                                  y: statusButton.frame.minY - 34 - userStatus.frame.height,
                                  width: 300,
                                  height: userStatus.font!.pointSize)
    }

}
