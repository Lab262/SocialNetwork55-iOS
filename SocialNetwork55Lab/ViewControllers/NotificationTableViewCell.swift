//
//  NotificationTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var textNotificationLabel: UILabel!
    
    @IBOutlet weak var actionFollowButton: UIButton!
    
    @IBOutlet weak var constraintSpaceRightLabel: NSLayoutConstraint!
    
    static var identifier: String {
        return "notificationCell"
    }
    
    static var cellHeight: CGFloat {
        return 85.0
    }
    
    static var nibName: String {
        return "NotificationTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBInspectable var profileImage: UIImage? {
        set {
            self.profileImageView.image = newValue
        }
        get {
            return self.profileImageView.image
        }
    }
    
    @IBInspectable var textNotification: String? {
        set {
            self.textNotificationLabel.text = newValue
        }
        get {
            return self.textNotificationLabel.text
        }
    }
    
}
