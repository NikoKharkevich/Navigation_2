//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 04.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private let label = UILabel()
    
    override var reuseIdentifier: String? {
        return "cellID"
    }

    // так как создаем в коде, то awakeFromNib вызываться не будет, поэтому настраиваем все в методе init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // настраиваем label
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // не используется
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with text: String) {
        label.textColor = .green
        label.text = text
    }

}
