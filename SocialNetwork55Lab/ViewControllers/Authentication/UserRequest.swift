//
//  UserRequest.swift
//  Boomerang
//
//  Created by Felipe perius on 07/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse


class UserRequest: NSObject {
    static func createAccountUser(user: User, pass: String, completionHandler: @escaping (_ success: Bool, _ msg: String) -> Void) {
        
        let pfUser = PFUser()
        
        pfUser.username = user.username
        pfUser.password = pass
        pfUser.email = user.email
        
        pfUser.signUpInBackground { (success, error) in
            if error == nil {
                completionHandler(true, "Sucesso")
            } else {
                
                completionHandler(false, error.debugDescription)
            }
        }
    }
    
    static func loginUserWithFacebook(id: String, email: String,userName: String ,mediaType:Int,completionHandler: @escaping (_ sucess: Bool, _ msg: String, _ user: User?) -> Void) {
        
        
    }
    
    static func forgotPass(email: String, completionHandler: @escaping (_ success: Bool, _ msg: String) -> Void) {
        
        PFUser.requestPasswordResetForEmail(inBackground: email) { (success, error) in
            if success {
                completionHandler(true, "Success")
            } else {
                if error!.localizedDescription.contains("No user found with email") {
                    
                    completionHandler(false, "Email não encontrado.")
                }
                completionHandler(false, error!.localizedDescription)
            }
        }
    }
    
    static func loginUser(email: String, pass: String, completionHandler: @escaping (_ success: Bool, _ msg: String) -> Void) {
        
        PFUser.logInWithUsername(inBackground: email, password: pass) { (success, error) in
            if error == nil {
                completionHandler(true, "Sucesso")
            } else {
                if error?.localizedDescription == "Invalid username/password." {
                    
                    completionHandler(false, "CPF ou senha inválida.")
                }
                
                completionHandler(false, error!.localizedDescription)
            }
        }
    }
}
