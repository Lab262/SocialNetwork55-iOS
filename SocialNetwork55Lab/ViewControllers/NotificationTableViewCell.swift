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
    
    var isFollow = false
    
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
        
        let fontGothamBold = UIFont.gothamBold(size: textNotificationLabel.font.pointSize)
        
        let fontGothamBook = UIFont.gothamBook(size: textNotificationLabel.font.pointSize)
        
        
        
        let customProfileName = NSMutableAttributedString(string: "\(notificationModel!.profileName!) ", attributes: [NSFontAttributeName:fontGothamBold, NSForegroundColorAttributeName: UIColor.blueLabelColor()])
        
        let customTextNotification = NSMutableAttributedString(string: notificationModel!.textNotification!, attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.blackLabelColor()])
        
        let customHourNotification = NSMutableAttributedString(string: " \(notificationModel!.hourNotification!)", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.backgroundGreyColor()])
        
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
    
    @IBAction func follow(_ sender: Any) {
        if !isFollow {
            isFollow = true
            actionFollowButton.bouncingAnimation(duration:0.25)
            actionFollowButton.backgroundColor = UIColor.pinkLabelColor()
            actionFollowButton.setTitle("Seguindo", for: UIControlState.normal)
        }else{
            isFollow = false
            actionFollowButton.bouncingAnimation(duration:0.25)
            actionFollowButton.backgroundColor = UIColor.blueLabelColor()
            actionFollowButton.setTitle("Seguir", for: UIControlState.normal)
        }
    }
}
