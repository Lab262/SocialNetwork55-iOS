//
//  User.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse

class User: PFUser {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var imageFile: PFFile?
    var profileImage: UIImage?
    var alreadySearched = false
    
    
    convenience init(user: PFUser) {
        self.init()
        
        self.setInformationsUserByPFUser(user: user)
    }
    
    
    func setInformationsUserByPFUser(user: PFUser){
        
        self.objectId = user.objectId
        
        if let firstName = user["firstName"] as? String {
            
            self.firstName = firstName
        }
        
        if let lastName = user["lastName"] as? String {
            
            self.lastName = lastName
        }
        
        if let email = user["email"] as? String {
            
            self.email = email
        }
        
        if let imageFile = user["photo"] as? PFFile {
            
            self.imageFile = imageFile
        }
    }
}
