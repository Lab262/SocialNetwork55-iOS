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
}

class BenefitPresenter: NSObject {
    
    private var benefits = [Benefit]()
    private var view: BenefitDelegate?
    
    func setViewDelegate(view: BenefitDelegate){
        self.view = view
    }
    
    func setBenefits(benefits: [Benefit]) {
        self.benefits = benefits
    }
    
    func getBenefits() -> [Benefit] {
        return self.benefits
    }
    
    func getAllBenefits() {
        BenefitRequest.getAllBenefits { (success, msg, benefits) in
            
            if success{
                self.benefits = benefits!
                self.view?.reloadTableView()
            }else{
                self.view?.showMessage(error: msg)
            }
        }
    }
}
