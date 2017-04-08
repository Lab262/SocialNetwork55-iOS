//
//  AuthenticationMainViewController.swift
//  SocialNetwork55Lab
//
//  Created by Thiago-Bernardes on 14/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class AuthenticationMainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
        UIApplication.shared.statusBarStyle = .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTitleLabel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationKeyNames.notificationChangeBackground), object: nil)
        
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
    
    func setupCustomTitleLabel(){
        
        let customTitleWhite = NSMutableAttributedString(string: "Seja Bem vindo a nossa +55lab.", attributes: [NSFontAttributeName:titleLabel.font, NSForegroundColorAttributeName: UIColor.white])
        
        let customTitleBlue = NSMutableAttributedString(string: " Community", attributes: [NSFontAttributeName:titleLabel.font, NSForegroundColorAttributeName: UIColor.lightBlueLabelColor()])
        
        customTitleWhite.append(customTitleBlue)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 12
        
        customTitleWhite.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, customTitleWhite.length))

        titleLabel.attributedText = customTitleWhite
        
        self.loadViewIfNeeded()
    }
}
