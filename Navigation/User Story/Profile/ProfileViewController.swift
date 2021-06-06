//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Nikola Kharkevich on 19.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let cellId = "cellId"
    private var ourPosts = [ModelPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setupTableView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func setupTableView() {
//        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cellID")

    }

}

// MARK: UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ourPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostTableViewCell
        cell.textLabel?.text = ourPosts[indexPath.row].author

//        cell.delegate = self

        return cell
    }

}

// MARK: UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.reuseId) as! ProfileHeaderView
//
//        let postSection = ourPosts[section]
//
//        headerView.deviceSection = deviceSection
//
//        return headerView
//    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
}
