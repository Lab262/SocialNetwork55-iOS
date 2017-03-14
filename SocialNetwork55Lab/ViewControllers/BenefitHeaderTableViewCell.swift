//
//  BenefitHeaderTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BenefitHeaderTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "benefitHeaderCell"
    }
    
    static var cellHeight: CGFloat {
        return 168.0
    }
    
    static var nibName: String {
        return "BenefitHeaderTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var datailBannerImageView: UIImageView!
    
    @IBInspectable var bannerImage: UIImage? {
        set {
            self.bannerImageView.image = newValue
        }
        get {
            return self.bannerImageView.image
        }
    }
    
    @IBInspectable var datailBannerImage: UIImage? {
        set {
            self.datailBannerImageView.image = newValue
        }
        get {
            return self.datailBannerImageView.image
        }
    }
    
    @IBInspectable var title: String? {
        set {
            self.titleLabel.text = newValue
        }
        get {
            return self.titleLabel.text
        }
    }
    
    @IBInspectable var descriptionString: String? {
        set {
            self.descriptionLabel.text = newValue
        }
        get {
            return self.descriptionLabel.text
        }
    }
    
}
