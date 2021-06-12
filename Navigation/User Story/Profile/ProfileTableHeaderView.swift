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
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(deviceImageView)
        
        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: deviceImageView.leadingAnchor),
            
            deviceImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            deviceImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deviceImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            deviceImageView.widthAnchor.constraint(equalToConstant: 60),
            deviceImageView.heightAnchor.constraint(equalTo: deviceImageView.widthAnchor)
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
