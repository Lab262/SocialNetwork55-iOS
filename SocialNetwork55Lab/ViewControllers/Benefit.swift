//
//  Benefit.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

class Benefit: PFObject {
    
    var bannerImage: UIImage?
    var type: String?
    
    
//    @NSManaged var image: PFFile?
    @NSManaged var name: String?
    @NSManaged var nameType: String?
    @NSManaged var shortDescription: String?
    @NSManaged var descriptionBenefit: String?
    @NSManaged var typeBenefit: PFObject?
    
    
    
    override init(){
        super.init()
    }
    
    convenience init(object: PFObject) {
        self.init()
        setInformationsBenefitByPFObject(object: object)
    }
    
    
    func setInformationsBenefitByPFObject(object: PFObject){
        
        self.objectId = object.objectId
        
        if let name = object["name"] as? String{
            self.name = name
        }
        
        if let nameType = object["nameType"] as? String{
            self.nameType = nameType
        }
        
        if let shortDescription = object["shortDescription"] as? String{
            self.shortDescription = shortDescription
        }
        
        if let descriptionBenefit = object["descriptionBenefit"] as? String{
            self.descriptionBenefit = descriptionBenefit
        }
        
        if let type = object["type"] as? PFObject{
            self.typeBenefit = type
            self.type = type["name"] as? String
        }
        
//        if let image = object["image"] as? PFFile{
//            self.image = image
//        }
        
    }
    
}

extension Benefit: PFSubclassing {
    static func parseClassName() -> String {
        return "Benefit"
    }
}
