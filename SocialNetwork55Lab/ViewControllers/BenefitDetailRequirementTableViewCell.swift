//
//  BenefitDetailRequirementTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitDetailRequirementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var requirementTextField: TextFieldPadding!
    
    static var identifier: String {
        return "benefitDetailRequirementCell"
    }
    
    static var cellHeight: CGFloat {
        return 190.0
    }
    
    static var nibName: String {
        return "BenefitDetailRequirementTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
