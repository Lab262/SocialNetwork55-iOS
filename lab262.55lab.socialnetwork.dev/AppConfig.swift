//
//  AppConfig.swift
//  SocialNetwork55Lab
//
//  Created by Thiago-Bernardes on 17-04-20.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

class AppConfig: NSObject {
    
    struct parse {
        static let baseClientConfig = ParseClientConfiguration {
            $0.applicationId = "lab262_55lab_social_network"
            $0.clientKey = ""
            $0.server = "http://socialnetwork55lab.herokuapp.com/parse"
        }
    }
    
}
