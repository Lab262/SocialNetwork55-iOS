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
    let  tableViewTopInset: CGFloat = 145
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!

    @IBOutlet weak var allBenefitsButton: UIButton!
    
    @IBOutlet weak var healthBenefitsButton: UIButton!
    
    @IBOutlet weak var studyBenefitsButton: UIButton!
    
    
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
        setupTableView()
        setupNavigationBarView()
        
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsetsMake(tableViewTopInset, 0, 0, 0)
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setupNavigationBarView() {
        navigationBarView.rightIcon.isHidden = true
        navigationBarView.rightButton.isHidden = true
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func filterAllBenefitsAction(_ sender: Any) {
    }
    
    @IBAction func filterHealthBenefitsAction(_ sender: Any) {
    }
    
    @IBAction func filterStudyBenefitsAction(_ sender: Any) {
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
        
        cell.contentView.backgroundColor = UIColor.white
        
        return cell
    }
    
    func generateActionButton(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActionButtonTableViewCell.identifier, for: indexPath) as! ActionButtonTableViewCell
        
        cell.actionButton.tag = indexPath.row/4
        
        cell.actionButton.addTarget(self, action: #selector(callBenefitDetailController(_:)), for: .touchUpInside)

        return cell
    }
    
    func callBenefitDetailController(_ sender: UIButton) {
        let viewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Benefits",identifier: "benefitDetail") as! BenefitDetailViewController
            viewController.benefit = allBenefits[sender.tag]
            self.navigationController?.pushViewController(viewController, animated: true)
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

