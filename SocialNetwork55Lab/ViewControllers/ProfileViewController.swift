//
//  ProfileViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 12/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var backgroundImageHeight: CGFloat = 208
    let tableViewTopInset: CGFloat = 150.0
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var backgroundImageHeightConstraint: NSLayoutConstraint!
    
    func registerNibs() {
        tableView.registerNibFrom(UserInformationTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarView.leftOfRightButton.isHidden = false
        navigationBarView.rightButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        tableView.contentInset = UIEdgeInsetsMake(tableViewTopInset, 0, 0, 0)
        navigationBarView.leftOfRightButton.addTarget(self, action: #selector(editProfile(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    func editProfile(_ sender: UIButton){
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationBarView.leftOfRightButton.isHidden = true
        navigationBarView.rightButton.isEnabled = true
    }
    
    func generateUserInformations(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserInformationTableViewCell.identifier, for: indexPath)
        
        return cell
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return generateUserInformations(tableView, cellForRowAt: indexPath)
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension ProfileViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        
        updateImageScale(yOffset)
        updateNavigationBarAlpha(yOffset)
        updateInformationsCell(yOffset)
    }
    
    
    func updateInformationsCell(_ yOffset: CGFloat) {
        
        let informationAlphaThreshold: CGFloat = 20.0
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        if yOffset > 0 {
            
            let alpha = (yOffset)/informationAlphaThreshold
            
            print(alpha)
            print("yofset \(yOffset)")
            cell?.backgroundColor = cell!.backgroundColor?.withAlphaComponent(alpha)
            
        } else {
            cell?.backgroundColor = cell!.backgroundColor?.withAlphaComponent(0.0)
        }
    }

    
    func updateImageScale(_ yOffset: CGFloat) {
        
        if yOffset < 0 {
            backgroundImageHeightConstraint.constant = backgroundImageHeight - yOffset
        } else if backgroundImageHeightConstraint.constant != backgroundImageHeight {
            backgroundImageHeightConstraint.constant = backgroundImageHeight
        }
    }
    
    func updateNavigationBarAlpha(_ yOffset: CGFloat) {
        let navbarAlphaThreshold: CGFloat = 64.0
        
        if yOffset > (backgroundImageHeight - navbarAlphaThreshold) {
            
            let alpha = (yOffset - backgroundImageHeight + navbarAlphaThreshold)/navbarAlphaThreshold
            
            navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(alpha)
        } else {
            navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(0.0)
        }
    }
}

