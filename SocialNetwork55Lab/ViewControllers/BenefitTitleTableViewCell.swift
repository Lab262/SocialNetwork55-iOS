//
//  BenefitTitleTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitTitleTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "benefitTitleCell"
    }
    
    static var cellHeight: CGFloat {
        return 75.0
    }
    
    static var nibName: String {
        return "BenefitTitleTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBInspectable var title: String? {
        set {
            self.titleLabel.text = newValue
        }
        get {
            return self.titleLabel.text
        }
    }
    
    
}
