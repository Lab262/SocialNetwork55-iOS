//
//  AuthenticationMainViewController.swift
//  SocialNetwork55Lab
//
//  Created by Thiago-Bernardes on 14/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class AuthenticationMainViewController: UIViewController {
    
    
    @IBOutlet weak var apresentationTitleLabel: UILabel!
    
    @IBOutlet weak var apresentationDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var firstBlurImage: UIImageView!
    @IBOutlet weak var secondBlurImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: keyNotificationChangeBackground), object: nil)
        
        if let _ = segue.destination as? CreateAccountViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
        
        if let _ = segue.destination as? LoginViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signInAction(_ sender: Any) {
        self.showHomeVC()

    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        self.showHomeVC()

    }
    
    
    @IBAction func facebookAction(_ sender: Any) {
        self.showHomeVC()
    }

    func showHomeVC() {
        
//        DefaultsHelper.sharedInstance.email = "thiago@lab262.com"
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let vcToShow = storyboard.instantiateInitialViewController()!
//        self.present(vcToShow, animated: true, completion: nil)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
