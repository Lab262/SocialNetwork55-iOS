//
//  UILabelExtension.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 12/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension UILabel {
    func setDynamicFont() {
        self.font = UIFont(name: self.font.fontName, size: self.getConstantHeight()*self.font.pointSize)!
    }
}
