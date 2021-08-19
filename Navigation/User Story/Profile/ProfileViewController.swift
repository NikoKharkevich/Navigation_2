
import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()
    
    let userService: UserService
    let enteredUserName: String
    
    init(userService: UserService, enteredUserName: String) {
        self.userService = userService
        self.enteredUserName = enteredUserName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugCheck()
        setupTableView()
        showUserData()
    }
    
    func showUserData() {
        if let user = self.userService.userService(userName: self.enteredUserName) {
            profileHeader.userName.text = user.userName
            profileHeader.userStatus.text = user.userStatus
            profileHeader.avatarImageView.image = user.userAvatar
        }
    }
    
/*    Задача 1.2
    Создать дубликат текущей схемы проекта, настроить запуск приложения с Release конфигурацией.
    На экране ProfileViewController настроить разный цвет фона для Debug и Release сборки с помощью флага компиляции DEBUG.
    Запустить обе схемы и проверить, что цвет фона меняется.
 */
    func debugCheck() {
        #if DEBUG
        view.backgroundColor = .yellow
        #else
        view.backgroundColor = .lightGray
        #endif
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.toAutoLayout()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

// MARK: UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return postArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.post = postArray[indexPath.row]
            return cell
        }
    }
}

// MARK: UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil}
        let headerView = profileHeader
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return UITableView.automaticDimension
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(type(of: self), #function)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.section == 0 else {
            print("❌ Wrong section")
            return
        }
        
        let vc = storyboard?.instantiateViewController(identifier: "PhotosVC") as! PhotosViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
