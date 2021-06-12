
import UIKit

class ProfileHeaderView: UIView {
    
//    private var statusText: String = ""
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView(image: #imageLiteral(resourceName: "Minon (1)"))
    
        avatarImageView.toAutoLayout()
        return avatarImageView
        
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(avatarImageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        let constraints = [
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    

    //
//    @IBOutlet weak var avatarImageView: UIImageView!
//    @IBOutlet weak var fullNameLabel: UITextField!
//    @IBOutlet weak var setStatusButton: UIButton!
//    @IBAction func setStatusButton(_ sender: UIButton) {
//        statusLabel.text = statusTextField.text
//    }
//
//    @IBOutlet weak var statusLabel: UILabel!
//    @IBOutlet weak var statusTextField: UITextField!
//
//    @objc func statusTextChanged() {
//        statusText = statusTextField.text!
//    }
    
//    override func awakeFromNib() {
//        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
//        avatarImageView.layer.borderWidth = 3
//        avatarImageView.layer.borderColor = UIColor.white.cgColor
//        avatarImageView.clipsToBounds = true
//
//        setStatusButton.setTitle("Set status", for: .normal)
//        setStatusButton.setTitleColor(.white, for: .normal)
//        setStatusButton.backgroundColor = .systemBlue
//        setStatusButton.layer.cornerRadius = 4
//        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//        setStatusButton.layer.shadowRadius = 4
//        setStatusButton.layer.shadowColor = UIColor.black.cgColor
//        setStatusButton.layer.shadowOpacity = 0.7
//
//        setStatusButton.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
//
//        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        statusLabel.textColor = .gray
//
//        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        fullNameLabel.textColor = .black
//        fullNameLabel.text = "My Name..."
//
//        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//        statusTextField.textColor = .black
//        statusTextField.backgroundColor = .white
//
//        statusTextField.layer.cornerRadius = 12
//        statusTextField.layer.borderColor = UIColor.black.cgColor
//        statusTextField.layer.borderWidth = 1
//        statusTextField.clipsToBounds = true
//    }
    
}
