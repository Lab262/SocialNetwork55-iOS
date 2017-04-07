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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!

    func dummyContent() {
        for _ in 0...4 {
            allBenefits.append(Benefit(bannerImage: nil, bannerTitle: "BE FREE", bannerSubTitle: "Seguro de vida", title: "Desconto de 30% no Seguros Bradesco", descriptionBenefit: "As we grow, we do so in fits and starts, lurching forward then back, sometimes looking more like clowns than seekers. Winston Churchill wrote: “Man will occasionally stumble over the truth, but most of…"))
        }
    }
    
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
    
    func generateBenefitHeader(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitHeaderTableViewCell.identifier, for: indexPath) as! BenefitHeaderTableViewCell
        
        cell.benefit = allBenefits[modelIndex]
        
        
        return cell
    }
    
    func generateBenefitTitle(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitTitleTableViewCell.identifier, for: indexPath) as! BenefitTitleTableViewCell
        
        cell.benefit = allBenefits[modelIndex]
        
        return cell
    }
    
    func generateDescriptionInformation(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationDescriptionTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func generateActionButton(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActionButtonTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
}

extension BenefitViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allBenefits.count * 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let modelIndex = indexPath.row / 4
        
        switch indexPath.row % 4 {
        case 0:
            return generateBenefitHeader(tableView, cellForRowAt: indexPath, modelIndex: modelIndex)
        case 1:
            return generateBenefitTitle(tableView, cellForRowAt: indexPath, modelIndex: modelIndex)
        case 2:
            return generateDescriptionInformation(tableView, cellForRowAt: indexPath, modelIndex: modelIndex)
        case 3:
            return generateActionButton(tableView, cellForRowAt: indexPath, modelIndex: modelIndex)
        default:
            return UITableViewCell()
        }
    }
    
}

