//
//  NotificationViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 12/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    var allNotifications = [NotificationModel]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    let tableViewBottomInset: CGFloat = 10
    let tableViewTopInset: CGFloat = 95
    
    func dummyContent() {
        for _ in 0...3 {
            allNotifications.append(NotificationModel(profileImage:nil, profileName: "Maria Luiza", textNotification: " fez um comentário em seu post.", hourNotification: " 2h", isFollowNotification: false))
        }
        allNotifications.append(NotificationModel(profileImage:nil, profileName: "Thiago Bernardes", textNotification: " começou a te seguir.", hourNotification: " 2h", isFollowNotification: true))
    }
    
    func registerNibs() {
        tableView.registerNibFrom(NotificationTableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyContent()
        setUpNavigationBar()
        registerNibs()
        setupTableView()
        setupNavigationBarView()
        
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsetsMake(tableViewTopInset, 0, tableViewBottomInset, 0)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setupNavigationBarView() {
        navigationBarView.rightIcon.isHidden = true
        navigationBarView.rightButton.isHidden = true
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        
    }
    
    
    
    func generateNotification (_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as! NotificationTableViewCell
        
        cell.notificationModel = allNotifications[modelIndex]
        
        return cell
    }
    
}

extension NotificationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allNotifications.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return generateNotification(tableView, cellForRowAt: indexPath, modelIndex: indexPath.row)
        
        }
}

