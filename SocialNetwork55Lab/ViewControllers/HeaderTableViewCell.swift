//
//  HeaderTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "headerCell"
    }
    
    static var cellHeight: CGFloat {
        return 300.0
    }
    
    static var nibName: String {
        return "HeaderTableViewCell"
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
