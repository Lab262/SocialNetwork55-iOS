//
//  ActionButtonTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ActionButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionButton: UIButton!
    
    static var identifier: String {
        return "actionButtonCell"
    }
    
    static var cellHeight: CGFloat {
        return 70.0
    }
    
    static var nibName: String {
        return "ActionButtonTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
