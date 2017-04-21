//
//  BenefitRequest.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 21/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse


class BenefitRequest: NSObject {
    static func getAllBenefits(completionHandler: @escaping (_ success: Bool, _ msg: String, [Benefit]?) -> ()) {
        
        var benefits = [Benefit]()
        
        ParseRequest.getAllObjectsFor(className: "Benefit") { (success, msg, objects) in
            if success {
                for object in objects! {
                    let benefit = Benefit(object: object)
                    benefits.append(benefit)
                }
                completionHandler(success, msg, benefits)
                
            }else{
                completionHandler(success, msg, nil)
            }
        }
    }
}
