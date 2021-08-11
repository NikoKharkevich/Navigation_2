
import UIKit
import StorageService
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    var post: ModelPost? {
        didSet {
            postName.text = post?.author
            postImage.image = UIImage(named: post!.image)
            postLikes.text = "Likes: \(post?.likes ?? 0)"
            postViews.text = "Views: \(post?.views ?? 0)"
            postText.text = post?.desciption
            
            if let image = UIImage(named: post!.image) {
                imageProcessor.processImage(sourceImage: image, filter: post!.filter) {
                    (image) in
                    postImage.image = image
                }
            }
        }
    }
    
    private let imageProcessor = ImageProcessor()

    static let identifier = "PostTableViewCell"
    
    private let postName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.toAutoLayout()
        
        return image
        
    }()
    
    private let postText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    private let postLikes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        
        return label
    }()
    
    private let postViews: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        
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
        
        
        
        let cellConstraints = [
            postName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postName.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postImage.topAnchor.constraint(equalTo: postName.bottomAnchor, constant: 16),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postLikes.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postViews.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ]
        NSLayoutConstraint.activate(cellConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
