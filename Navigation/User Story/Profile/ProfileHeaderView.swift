
import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
     var avatarImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image8")!)
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.toAutoLayout()
        return image
    }()
    
     var userName: UILabel = {
        let label = UILabel()
//        label.text = "Crazy Dave"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
     var userStatus: UILabel = {
        let label = UILabel()
//        label.text = "I am so excited..."
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
        
    }
    
}
