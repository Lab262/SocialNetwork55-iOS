//
//  BenefitViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 12/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitViewController: UIViewController {
    
    var presenter = BenefitPresenter()
    let  tableViewTopInset: CGFloat = 145
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var collectionPickerView: CollectionPickerView!
    
    func registerNibs() {
        tableView.registerNibFrom(BenefitHeaderTableViewCell.self)
        tableView.registerNibFrom(BenefitTitleTableViewCell.self)
        tableView.registerNibFrom(ActionButtonTableViewCell.self)
        tableView.registerNibFrom(InformationDescriptionTableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPresenter()
        getData()
        setUpNavigationBar()
        registerNibs()
        setupTableView()
        setupNavigationBarView()
        setUpCollectionPickerView()
        
    }
    
    func setUpPresenter(){
        self.presenter.setViewDelegate(view: self)
    }
    
    func getData() {
        self.presenter.getAllBenefits()
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
    
    func setUpCollectionPickerView() {
        collectionPickerView.collectionPickerOptions = ["Todos", "Seguros", "Academia"]
        collectionPickerView.collectionPickerHandlers = [{}, {}, {}]
    }
    
    
    func generateBenefitHeader(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitHeaderTableViewCell.identifier, for: indexPath) as! BenefitHeaderTableViewCell
        
        cell.benefit = self.presenter.getBenefits()[modelIndex]
        
        
        return cell
    }
    
    func generateBenefitTitle(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BenefitTitleTableViewCell.identifier, for: indexPath) as! BenefitTitleTableViewCell
        
        cell.benefit = self.presenter.getBenefits()[modelIndex]
        
        return cell
    }
    
    func generateDescriptionInformation(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, modelIndex: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationDescriptionTableViewCell.identifier, for: indexPath) as! InformationDescriptionTableViewCell
        
        cell.contentView.backgroundColor = UIColor.white
        cell.descriptionLabel.text = self.presenter.getBenefits()[modelIndex].descriptionBenefit
        
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
        
            viewController.benefit = self.presenter.getBenefits()[sender.tag]
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension BenefitViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getBenefits().count * 4
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

extension BenefitViewController: BenefitDelegate{
    
    func reloadTableView(){
        self.tableView.reloadData()
    }
    
    func showMessage(error: String){
        self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: error), animated: true, completion: nil)
    }
    
}

