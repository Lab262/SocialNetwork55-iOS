//
//  UserWorkCollectionViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class UserWorkCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var photoButton: UIButton!
    
    static var identifier: String {
        return "userWorkCollectionCell"
    }
    
    static var cellHeight: CGFloat {
        return 50.0
    }
    
    static var nibName: String {
        return "UserWorkCollectionViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
