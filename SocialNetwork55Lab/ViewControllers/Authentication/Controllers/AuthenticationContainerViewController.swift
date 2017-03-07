//
//  AuthenticationContainerViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

let keyNotificationChangeBackground = "changeBackground"

class AuthenticationContainerViewController: UIViewController {

    @IBOutlet weak var firstBackground: UIImageView!
    
    @IBOutlet weak var secondBackground: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.window?.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerObserver()
        // Do any additional setup after loading the view.
    }

    func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundImage(_:)), name: NSNotification.Name(rawValue: keyNotificationChangeBackground), object: nil)
        
    }
    
    func changeBackgroundImage(_ notification: Notification) {
        
        
        UIView.animate(withDuration: 0.5) { 
            if self.firstBackground.alpha == 1 {
                self.firstBackground.alpha = 0
            } else {
                self.firstBackground.alpha = 1
            }
            
            if self.secondBackground.alpha == 1 {
                self.secondBackground.alpha = 0
            } else {
                self.secondBackground.alpha = 1
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
