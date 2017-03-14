//
//  BenefitViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 12/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitViewController: UIViewController {
    
    var allBenefits = [Benefit]()

    func dummyContent() {
        for _ in 0...4{
            
            allBenefits.append(Benefit(bannerImage: nil, bannerTitle: "BE FREE", bannerSubTitle: "Seguro de vida", title: "Desconto de 30% no Seguros Bradesco", descriptionBenefit: "As we grow, we do so in fits and starts, lurching forward then back, sometimes looking more like clowns than seekers. Winston Churchill wrote: “Man will occasionally stumble over the truth, but most of…"))
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    
    func registerNibs() {
        tableView.registerNibFrom(BenefitHeaderTableViewCell.self)
        tableView.registerNibFrom(BenefitTitleTableViewCell.self)
        tableView.registerNibFrom(ActionButtonTableViewCell.self)
        tableView.registerNibFrom(InformationDescriptionTableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyContent()
        setUpNavigationBar()
        registerNibs()
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func generateBenefitHeader(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitHeaderTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func generateBenefitTitle(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitTitleTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func generateDescriptionInformation(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationDescriptionTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func generateActionButton(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActionButtonTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
}

extension BenefitViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return generateBenefitHeader(tableView, cellForRowAt: indexPath)
        case 1:
            return generateBenefitTitle(tableView, cellForRowAt: indexPath)
        case 2:
            return generateDescriptionInformation(tableView, cellForRowAt: indexPath)
        case 3:
            return generateActionButton(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        
        }
    }
}

