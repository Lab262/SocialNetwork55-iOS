//
//  BenefitTitleTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static var identifier: String {
        return "benefitTitleCell"
    }
    
    static var cellHeight: CGFloat {
        return 75.0
    }
    
    static var nibName: String {
        return "BenefitTitleTableViewCell"
    }
    
    var benefit: Benefit? {
        didSet{
            updateBenefitsUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateBenefitsUI(){
        titleLabel.text = benefit?.title
    }
    
    
}
