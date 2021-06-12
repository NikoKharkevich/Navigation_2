//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 12.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    let profileHeaderView = ProfileHeaderView()

    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        avatarImageView.toAutoLayout()
        
        return avatarImageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .red
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    private let deviceImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Minon (1)"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profileHeaderView)
        profileHeaderView.toAutoLayout()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(deviceImageView)
        contentView.addSubview(avatarImageView)
        
        let constraints = [
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: deviceImageView.leadingAnchor),
            
            deviceImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            deviceImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deviceImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            deviceImageView.widthAnchor.constraint(equalToConstant: 60),
            deviceImageView.heightAnchor.constraint(equalTo: deviceImageView.widthAnchor),
            
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
