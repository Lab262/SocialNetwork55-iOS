//
//  Benefit.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

class Benefit: NSObject {
    
    var bannerImage: UIImage?
    var bannerTitle: String?
    var bannerSubTitle: String?
    var title: String?
    var descriptionBenefit: String?
    
    override init() {
        super.init()
        self.bannerImage = nil
        self.bannerTitle = ""
        self.bannerSubTitle = ""
        self.title = ""
        self.descriptionBenefit = ""
    }
    
    init(bannerImage: UIImage?, bannerTitle: String?, bannerSubTitle: String?, title: String?, descriptionBenefit: String?) {
        super.init()
        self.bannerImage = bannerImage
        self.bannerTitle = bannerTitle
        self.bannerSubTitle = bannerSubTitle
        self.title = title
        self.descriptionBenefit = descriptionBenefit
    }
}
