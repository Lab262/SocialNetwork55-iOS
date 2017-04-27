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
            $0.applicationId = "api-55lab-test"
            $0.clientKey = ""
            $0.server = "http://api-55lab-test.herokuapp.com/parse"
        }
    }
    
}
