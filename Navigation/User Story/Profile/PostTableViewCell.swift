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
        let postName = UILabel()
        postName.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postName.textColor = .black
        
        return postName
    }()
    
    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        
        return postImage
        
    }()
    
    private let postText: UITextField = {
        let postText = UITextField()
        postText.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postText.textColor = .systemGray
//        numberOfLines = 0
        
        return postText
    }()
    
    private let postLikes: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        
        return likes
    }()
    
    private let postViews: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        
        return views
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
        postName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        postName.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.topAnchor.constraint(equalTo: postName.bottomAnchor, constant: 12).isActive = true
        postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        postText.translatesAutoresizingMaskIntoConstraints = false
        postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16).isActive = true
        postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        postText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        postLikes.translatesAutoresizingMaskIntoConstraints = false
        postLikes.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16).isActive = true
        postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        postViews.translatesAutoresizingMaskIntoConstraints = false
        postViews.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16).isActive = true
        postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }

}
