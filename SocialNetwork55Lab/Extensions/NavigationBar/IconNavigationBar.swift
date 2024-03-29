//
//  IconNavigationBar.swift
//  SocialNetwork55Lab
//
//  Created by Thiago-Bernardes on 08/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit


class IconNavigationBar: UIView {

    @IBOutlet var view: UIView!
//    @IBOutlet weak var leftButtonIcon: UIImageView!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var titleIcon: UIImageView!
    @IBOutlet weak var rightIcon: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var leftOfRightButton: UIButton!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var leftDetailImage: UIImageView!
//    @IBAction func leftAction(_ sender: Any) {
//        
//        if let navController = UIApplication.topViewController()?.navigationController {
//            navController.popViewController(animated: true)
//        }
//    }
    @IBOutlet weak var detailBackView: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    @IBOutlet weak var smallTitleLabel: UILabel!
    
    @IBAction func rightButtonAction(_ sender: Any) {
        if let navController = UIApplication.topViewController()?.navigationController {
            navController.pushViewController(ViewUtil.viewControllerFromStoryboardWithIdentifier("Profile")!, animated: true)
        }
    }
    @IBAction func backAction(_ sender: Any) {
        if let navController = UIApplication.topViewController()?.navigationController {
            navController.popViewController(animated: true)
        }

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibInit()
    }
    
    func nibInit() {
        _ = Bundle.main.loadNibNamed("IconNavigationBar", owner: self, options: nil)?[0]
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    
    
//    @IBInspectable var leftButtonIconImage: UIImage? {
//        set {
//            self.leftButtonIcon.image = newValue
//        }
//        get {
//            return self.leftButtonIcon.image
//        }
//    }
//    
//    @IBInspectable var titleIconImage: UIImage? {
//        set {
//            self.titleIcon.image = newValue
//        }
//        get {
//            return self.titleIcon.image
//        }
//    }
    
    @IBInspectable var rightBarIconImage: UIImage? {
        set {
            self.rightIcon.image = newValue
        }
        get {
            return self.rightIcon.image
        }
    }
    
    @IBInspectable var titleBarLabel: String? {
        set {
            self.titleTextLabel.attributedText = newValue?.with(lineSpacing: 15.0)
        }
        get {
            return self.titleTextLabel.text
        }
    }

    
//    @IBInspectable var titleLabelText: String? {
//        set {
//            self.titleLabel.text = newValue
//        }
//        get {
//            return self.titleLabel.text
//        }
//    }
    
}


