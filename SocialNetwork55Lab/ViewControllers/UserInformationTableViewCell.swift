//
//  UserInformationTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 12/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class UserInformationTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "userInformationCell"
    }
    
    static var cellHeight: CGFloat {
        return 50.0
    }
    
    static var nibName: String {
        return "UserInformationTableViewCell"
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
