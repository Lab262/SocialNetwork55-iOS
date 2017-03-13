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
    let tableViewTopInset: CGFloat = 101.0
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var backgroundImageHeightConstraint: NSLayoutConstraint!
    
    func registerNibs() {
        tableView.registerNibFrom(UserInformationTableViewCell.self)
        tableView.registerNibFrom(InformationDescriptionTableViewCell.self)
        tableView.registerNibFrom(HeaderTableViewCell.self)
        tableView.registerNibFrom(ContactInformationTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarView.leftOfRightButton.isHidden = false
        navigationBarView.rightButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        tableView.contentInset = UIEdgeInsetsMake(tableViewTopInset, 0, 0, 0)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
    
    func generateDescriptionInformation(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationDescriptionTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func generateContactInformation(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactInformationTableViewCell.identifier, for: indexPath) as! ContactInformationTableViewCell
        
        if indexPath.section == 2 && indexPath.row == 1 {
            cell.contactTitleLabel.text = "Trabalho com"
            cell.contactDescriptionLabel.isHidden = true
        }
        
        return cell
    }
    
    
    
    func generateHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> HeaderTableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        
        return header
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 1
        case 1, 2: return 2
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: return generateUserInformations(tableView, cellForRowAt: indexPath)
            default: return UITableViewCell()
            }
        case 1:
            switch indexPath.row {
            case 0: return generateDescriptionInformation(tableView, cellForRowAt: indexPath)
            case 1: return generateContactInformation(tableView, cellForRowAt: indexPath)
            default: return UITableViewCell()
            }
        case 2:
            switch indexPath.row {
            case 0: return generateDescriptionInformation(tableView, cellForRowAt: indexPath)
            case 1: return generateContactInformation(tableView, cellForRowAt: indexPath)
            default: return UITableViewCell()
            }
        default: return UITableViewCell()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = generateHeader(tableView, viewForHeaderInSection: section)
        let headerTitle: String
        
        switch section {
        case 0: return nil
        case 1: headerTitle = "Sobre"
        case 2: headerTitle = "Onde trabalho"
        default: headerTitle = ""
        }
        
        header.titleHeaderLabel.text = headerTitle
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 1, 2:
            return 100
        default:
            return CGFloat.leastNonzeroMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
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

