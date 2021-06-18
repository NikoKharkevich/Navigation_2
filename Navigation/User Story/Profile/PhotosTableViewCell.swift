
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifier = "PhotosTableViewCell"
    
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let image1: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "shepherd"))
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.toAutoLayout()
        return image
    }()
    
    private let image2: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "flamingo"))
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.toAutoLayout()
        return image
    }()
    
    private let image3: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "cow"))
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.toAutoLayout()
        return image
    }()
    
    private let image4: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "bizon"))
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.toAutoLayout()
        return image
    }()
    
    let photoStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.toAutoLayout()
        return stack
    }()
    
    let arrowButton: UIButton = {
        let image = UIImage(systemName: "arrow.right")
        
        let button = UIButton()
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true

        button.toAutoLayout()
        return button
    }()
    
    override var reuseIdentifier: String? {
        return "PhotosTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupPhotoCell()
        
        let constraints = [
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: sideIndent),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideIndent),
            
            photoStack.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: sideIndent),
            photoStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideIndent),
            photoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideIndent),
            photoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -sideIndent),
            photoStack.heightAnchor.constraint(equalToConstant: (contentView.frame.size.width - sideIndent * 2 - intervalIndent * 3) / 4),
            
            arrowButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideIndent),
            arrowButton.widthAnchor.constraint(equalToConstant: 30),
            arrowButton.heightAnchor.constraint(equalTo: arrowButton.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
}
    
    private var sideIndent: CGFloat { return 12 }
    private var intervalIndent: CGFloat { return 8}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhotoCell() {
        contentView.addSubview(photoLabel)
        contentView.addSubview(photoStack)
        contentView.addSubview(arrowButton)
        photoStack.addArrangedSubview(image1)
        photoStack.addArrangedSubview(image2)
        photoStack.addArrangedSubview(image3)
        photoStack.addArrangedSubview(image4)
    }

}
