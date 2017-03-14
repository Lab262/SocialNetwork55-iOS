//
//  Notification.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 14/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

class NotificationModel: NSObject {
    
    var profileImage: UIImage?
    var profileName: String?
    var textNotification: String?
    var hourNotification: String?
    var isFollowNotification: Bool?
    
    init(profileImage: UIImage?, profileName: String?, textNotification: String?, hourNotification: String?, isFollowNotification: Bool?) {
        super.init()
        self.profileImage = profileImage
        self.profileName = profileName
        self.textNotification = textNotification
        self.hourNotification = hourNotification
        self.isFollowNotification = isFollowNotification
    }

}
