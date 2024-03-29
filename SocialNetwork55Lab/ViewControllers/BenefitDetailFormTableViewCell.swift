//
//  BenefitDetailFormTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 10/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitDetailFormTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var informationMask: AKMaskField!
    
    static var identifier: String {
        return "benefitDetailFormCell"
    }
    
    static var cellHeight: CGFloat {
        return 65.0
    }
    
    static var nibName: String {
        return "BenefitDetailFormTableViewCell"
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
