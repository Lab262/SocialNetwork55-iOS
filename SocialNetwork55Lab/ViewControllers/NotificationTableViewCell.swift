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

    var notificationModel: NotificationModel? {
        didSet{
            updateNotificationUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateNotificationUI(){
        textNotificationLabel.text = ("\(notificationModel!.profileName!) \(notificationModel!.textNotification!) \(notificationModel!.hourNotification!)")
            //(notificationModel?.profileName)! + (notificationModel?.textNotification)! + notificationModel?.hourNotification
        if (notificationModel!.isFollowNotification)! {
            actionFollowButton.isHidden = false
            constraintSpaceRightLabel.constant = 125.0
        }else{
            actionFollowButton.isHidden = true
            constraintSpaceRightLabel.constant = 38.0
        }
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
