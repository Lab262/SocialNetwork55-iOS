//
//  CreateAccountViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forgetButton: UIButton!
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var cpfField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var cpfFieldSupportView: UIView!
    
    
    @IBOutlet weak var passFieldSupportView: UIView!
    @IBOutlet weak var emailFieldSupportView: UIView!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: keyNotificationChangeBackground), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgetAction(_ sender: Any) {
    }
    
    @IBAction func enterApp(_ sender: Any) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        if let _ = segue.destination as? AuthenticationMainViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
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
