//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 04.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
     var post: ModelPost? {
        didSet {
            postName.text = post?.author
            postImage.image = UIImage(named: post!.image)
            postLikes.text = "Likes: \(post?.likes ?? 0)"
            postViews.text = "Views: \(post?.views ?? 0)"
            postText.text = post?.desciption
        }
    }

    static let identifier = "PostTableViewCell"
    
    private let postName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
        
    }()
    
    private let postText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let postLikes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    private let postViews: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    override var reuseIdentifier: String? {
        return "PostTableViewCell"
    }
    
    func setupPostCell() {
        contentView.addSubview(postName)
        contentView.addSubview(postImage)
        contentView.addSubview(postText)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupPostCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        postName.translatesAutoresizingMaskIntoConstraints = false
        postName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        postName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        postName.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.topAnchor.constraint(equalTo: postName.bottomAnchor, constant: 12).isActive = true
        postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        postText.translatesAutoresizingMaskIntoConstraints = false
        postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16).isActive = true
        postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
//        postText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        
        postLikes.translatesAutoresizingMaskIntoConstraints = false
        postLikes.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16).isActive = true
        postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
//        postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
        postViews.translatesAutoresizingMaskIntoConstraints = false
        postViews.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16).isActive = true
        postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }

}
