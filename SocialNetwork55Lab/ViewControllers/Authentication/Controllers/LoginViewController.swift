//
//  LoginViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgetPass(_ sender: Any) {
        
    }

    @IBAction func backButtonAction(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
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
