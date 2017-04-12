//
//  BenefitDetailViewController.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitDetailViewController: UIViewController {

    @IBOutlet weak var navigationBar: IconNavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var benefit: Benefit?
    
    func registerNibs() {
    
        tableView.registerNibFrom(BenefitHeaderTableViewCell.self)
        tableView.registerNibFrom(BenefitDetailFormTableViewCell.self)
        tableView.registerNibFrom(BenefitDetailRequirementTableViewCell.self)
        tableView.registerNibFrom(ButtonTableViewCell.self)
    }
    
    func setupTableView() {
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setupTableView()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateBenefitHeader(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitHeaderTableViewCell.identifier, for: indexPath) as! BenefitHeaderTableViewCell
        
        cell.benefit = benefit
        
        return cell
    }
    
    func generateBenefitDetailForm(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitDetailFormTableViewCell.identifier, for: indexPath) as! BenefitDetailFormTableViewCell
        
        if indexPath.row == 1 {
            cell.descriptionLabel.text = "Seu nome:"
            cell.layoutIfNeeded()
            tableView.layoutIfNeeded()
        }else if indexPath.row == 2 {
            cell.descriptionLabel.text = "Seu email:"
            cell.informationMask.keyboardType = .emailAddress
            cell.layoutIfNeeded()
            tableView.layoutIfNeeded()
        }else if indexPath.row == 3 {
            cell.descriptionLabel.text = "Telefone:"
            cell.informationMask.keyboardType = .numberPad
            cell.layoutIfNeeded()
            tableView.layoutIfNeeded()
        }
        
        return cell
    }
    
    func generateBenefitDetailRequirement(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitDetailRequirementTableViewCell.identifier, for: indexPath) as! BenefitDetailRequirementTableViewCell
        
        return cell
    }
    
    func generateButton(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
        
        return cell
    }
}

extension BenefitDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            case 0:
                return generateBenefitHeader(tableView, cellForRowAt: indexPath, modelIndex: indexPath.row)
            case 1...3:
                return generateBenefitDetailForm(tableView, cellForRowAt: indexPath, modelIndex: indexPath.row)
            case 4:
                return generateBenefitDetailRequirement(tableView, cellForRowAt: indexPath, modelIndex: indexPath.row)
            case 5:
                return generateButton(tableView, cellForRowAt: indexPath, modelIndex: indexPath.row)
            default:
                return UITableViewCell()
        }
    }
    
}
