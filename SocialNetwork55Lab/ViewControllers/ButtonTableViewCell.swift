//
//  ButtonTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionButton: UIButton!

    @IBOutlet weak var widthButtonConstraint: NSLayoutConstraint!
    
    static var identifier: String {
        return "buttonCell"
    }
    
    static var cellHeight: CGFloat {
        return 105.0
    }
    
    static var nibName: String {
        return "ButtonTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionButton(_ sender: Any) {
        actionButton.bouncingAnimation(duration:0.20)
    }
    
    func updateForMoreButton(){
        self.contentView.backgroundColor = UIColor.backgroundLightGreyColor()
        actionButton.backgroundColor = UIColor.clear
        actionButton.setTitle("Veja mais", for: .normal)
        actionButton.titleLabel?.font = UIFont(name: "Aleo-Regular", size: 14)
        actionButton.setTitleColor(UIColor.pinkLabelColor(), for: .normal)
        actionButton.shadowColor = UIColor.clear
        actionButton.shadowRadius = 0.0
        self.layoutIfNeeded()
    }
    
}
