//
//  BenefitPresenter.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 21/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol BenefitDelegate {
    func reloadTableView()
    func showMessage(error: String)
    func setUpCollectionPickerView()
}

class BenefitPresenter: NSObject {
    
    private var benefits = [Benefit]()
    private var filteredBenefits = [Benefit]()
    private var typesBenefits = [String]()
    private var handlersTypesBenefits = [() -> ()]()
    private var view: BenefitDelegate?
    private let constantAllTypeBenefit = "Todos"
    
    func setViewDelegate(view: BenefitDelegate){
        self.view = view
    }
    
    func setBenefits(benefits: [Benefit]) {
        self.benefits = benefits
    }
    
    func getBenefits() -> [Benefit] {
        return self.benefits
    }
    
    func setFilteredBenefits(filteredBenefits: [Benefit]) {
        self.filteredBenefits = filteredBenefits
    }
    
    func getFilteredBenefits() -> [Benefit] {
        return self.filteredBenefits
    }
    
    func setTypesBenefits(typesBenefits: [String]) {
        self.typesBenefits = typesBenefits
    }
    
    func getTypesBenefits() -> [String] {
        return self.typesBenefits
    }
    
    func setHandlersTypesBenefits(handlersTypesBenefits: [() -> ()]) {
        self.handlersTypesBenefits = handlersTypesBenefits
    }
    
    func getHandlersTypesBenefitss() -> [() -> ()] {
        return self.handlersTypesBenefits
    }
    
    func getAllBenefits() {
        BenefitRequest.getAllBenefits { (success, msg, benefits) in
            
            if success{
                self.benefits = benefits!
                self.filteredBenefits = benefits!
                self.view?.reloadTableView()
            }else{
                self.view?.showMessage(error: msg)
            }
        }
    }
    
    func getAllTypesBenefits() {
        BenefitRequest.getAllTypesBenefits { (success, msg, typeBenefits) in
            
            if success{
                self.typesBenefits = typeBenefits!
                self.typesBenefits.insert(self.constantAllTypeBenefit, at: 0)
                self.generateAllHandlersTypesBenefits()
                self.view?.setUpCollectionPickerView()
            }else{
                self.view?.showMessage(error: msg)
            }
        }
    }
    
    func generateAllHandlersTypesBenefits() {
        for typeBenefit in typesBenefits {
            if typeBenefit != constantAllTypeBenefit {
                self.handlersTypesBenefits.append {
                    self.filterContentTableViewForSearchText(searchText: typeBenefit)
                }
            }else{
                self.handlersTypesBenefits.append {
                    self.resetFilter()
                }
            }
            
        }
    }
    
    func filterContentTableViewForSearchText(searchText: String) {
        
        var filterBenefits = [Benefit]()
        
        filterBenefits = self.getBenefits().filter() {
            if let benefit = ($0 as Benefit).type {
                return benefit.lowercased().contains(searchText.lowercased())
            }else{
                return false
            }
        }
        self.filteredBenefits = filterBenefits
        self.view?.reloadTableView()
    }
    
    func resetFilter() {
        self.filteredBenefits = self.benefits
        self.view?.reloadTableView()
    }
}
