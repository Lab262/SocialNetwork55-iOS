//
//  LoginViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var cpfField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var cpfFieldSupportView: UIView!
    @IBOutlet weak var passFieldSupportView: UIView!
    
    @IBOutlet weak var forgetButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        cpfField.attributedPlaceholder = NSAttributedString(string: "CPF",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        passField.attributedPlaceholder = NSAttributedString(string: "Senha",
                                                            attributes: [NSForegroundColorAttributeName: UIColor.white])

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgetPass(_ sender: Any) {
        
    }

    @IBAction func backButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: keyNotificationChangeBackground), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
        
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
   
        
        if let _ = segue.destination as? AuthenticationMainViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }


}
