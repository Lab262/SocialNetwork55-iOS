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
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!

    
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
    
    func updateForMoreButton(){
        //actionButton.backgroundColor = UIColor.white
        actionButton.setTitle("Veja mais", for: .normal)
        actionButton.titleLabel?.font = UIFont(name: "Aleo-Regular", size: 14)
        actionButton.titleLabel?.textColor = UIColor.black
        
        leadingConstraint.isActive = false
        centerConstraint.isActive = true
        self.layoutIfNeeded()
    }
}
