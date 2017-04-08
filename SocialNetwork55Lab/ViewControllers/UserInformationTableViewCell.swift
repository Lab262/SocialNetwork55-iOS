//
//  UserInformationTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 12/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class UserInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    
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
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(){
        
        let fontGothamBook = UIFont(name: "Gotham Book", size: professionLabel.font.pointSize)!
        
        
        //Set Profession Label
        let customProfessionFunction = NSMutableAttributedString(string:"Fundadora", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.blueLabelColor()])
        
        let customProfessionConector = NSMutableAttributedString(string:" da ", attributes: [NSFontAttributeName:professionLabel.font!, NSForegroundColorAttributeName: UIColor.greyLabelColor()])
        
        let customProfessionEnterprise = NSMutableAttributedString(string:"Lab262", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.blueLabelColor()])
        
        customProfessionFunction.append(customProfessionConector)
        customProfessionFunction.append(customProfessionEnterprise)
        
        professionLabel.attributedText = customProfessionFunction
        
        //Set Following and Followers Labels
        let customFollowingNumber = NSMutableAttributedString(string:"35", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.blueLabelColor()])
        
        let customFollowingName = NSMutableAttributedString(string:" following", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.backgroundGreyColor()])
        
        let customFollowersNumber = NSMutableAttributedString(string:"10", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.blueLabelColor()])
        
        let customFollowersName = NSMutableAttributedString(string:" followers", attributes: [NSFontAttributeName:fontGothamBook, NSForegroundColorAttributeName: UIColor.backgroundGreyColor()])
        
        customFollowingNumber.append(customFollowingName)
        customFollowersNumber.append(customFollowersName)
        
        followingLabel.attributedText = customFollowingNumber
        followersLabel.attributedText = customFollowersNumber
        
    }
    
}
