
import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Minon (1)"))
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.toAutoLayout()
        return image
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.text = "Crazy Dave"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let userStatus: UILabel = {
        let label = UILabel()
        label.text = "I am so excited..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.toAutoLayout()
        return label
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        button.toAutoLayout()
        return button
    }()
    
    private let setStatus: UITextField = {
        let text = UITextField()
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        text.placeholder = "Set your status here"
        text.clipsToBounds = true
        text.toAutoLayout()
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return text
    }()
    
    private var statusText = String()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = setStatus.text ?? "Enter new status"
    }
    
    @objc func buttonPressed() {
        userStatus.text = statusText
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(avatarImageView)
        addSubview(userName)
        addSubview(userStatus)
        addSubview(statusButton)
        addSubview(setStatus)
        
        setupConstraints()
    }
    
    private var sideInset: CGFloat { return 16 }
    
    func setupConstraints() {
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(sideInset)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.width.equalTo(110)
            make.height.equalTo(110)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(sideInset)
            make.height.equalTo(18)
        }
        
        statusButton.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(32)
            make.leading.equalTo(self.snp.leading).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).offset(-sideInset)
            make.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom).offset(-sideInset)
        }
        
        setStatus.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(sideInset)
            make.trailing.equalTo(self.snp.trailing).offset(-sideInset)
            make.bottom.equalTo(statusButton.snp.top).offset(-10)
            make.height.equalTo(40)
        }
        
        userStatus.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(sideInset)
            make.bottom.equalTo(setStatus.snp.top).offset(-10)
            make.height.equalTo(userStatus.font.pointSize)
        }
        /*
        let constraints = [
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            userName.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            userName.heightAnchor.constraint(equalToConstant: 18),
            
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            setStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            setStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatus.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            setStatus.heightAnchor.constraint(equalToConstant: 40),
            
            userStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            userStatus.bottomAnchor.constraint(equalTo: setStatus.topAnchor, constant: -10),
            userStatus.heightAnchor.constraint(equalToConstant: userStatus.font.pointSize)
            
        ]
        NSLayoutConstraint.activate(constraints)
 */
    }
    
}
