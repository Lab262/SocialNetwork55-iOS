//
//  UITextField+Padding.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class TextFieldPadding: UITextField {
    
    let padding = UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
