//
//  BenefitHeaderTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var datailBannerImageView: UIImageView!
    
    static var identifier: String {
        return "benefitHeaderCell"
    }
    
    static var cellHeight: CGFloat {
        return 168.0
    }
    
    static var nibName: String {
        return "BenefitHeaderTableViewCell"
    }
    
    var benefit: Benefit? {
        didSet{
            updateBenefitsUI()
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
    
    func updateBenefitsUI(){
        let fontBebasNeue = UIFont(name: "BebasNeue", size: titleLabel.font!.pointSize)!
        
        let customTitle = NSMutableAttributedString(string: benefit!.bannerTitle!, attributes: [NSFontAttributeName:fontBebasNeue, NSForegroundColorAttributeName: titleLabel.textColor])
        titleLabel.attributedText = customTitle
        descriptionLabel.text = benefit?.bannerSubTitle
     //   bannerImageView.image = benefit?.bannerImage
    }
    
    
    
    
    

    
    
}
