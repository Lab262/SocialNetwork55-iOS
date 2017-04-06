//
//  NotificationTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    let constantSpaceRightNotificationFollow:CGFloat = 125.0
    let constantSpaceRightNotification:CGFloat = 38.0
    
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
        
        let fontGothamBold = UIFont(name: "Gotham Bold", size: textNotificationLabel.font.pointSize)
        
        let fontGothamBook = UIFont(name: "Gotham Book", size: textNotificationLabel.font.pointSize)
        
        
        let customProfileName = NSMutableAttributedString(string: "\(notificationModel!.profileName!) ", attributes: [NSFontAttributeName:fontGothamBold!])
        
        let customTextNotification = NSMutableAttributedString(string: notificationModel!.textNotification!, attributes: [NSFontAttributeName:fontGothamBook!])
        
        let customHourNotification = NSMutableAttributedString(string: " \(notificationModel!.hourNotification!)", attributes: [NSFontAttributeName:fontGothamBook!, NSForegroundColorAttributeName: UIColor.colorWithHexString("7B7B7B")])
        
        customProfileName.append(customTextNotification)
        customProfileName.append(customHourNotification)
        
        textNotificationLabel.attributedText = customProfileName
        
        if (notificationModel!.isFollowNotification)! {
            actionFollowButton.isHidden = false
            constraintSpaceRightLabel.constant = constantSpaceRightNotificationFollow
        }else{
            actionFollowButton.isHidden = true
            constraintSpaceRightLabel.constant = constantSpaceRightNotification
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
