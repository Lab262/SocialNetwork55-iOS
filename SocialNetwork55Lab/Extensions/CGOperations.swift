//
//  CGOperations.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 24/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension CGPoint {
    
    func distance(to point: CGPoint) -> CGFloat {
        return hypot(self.x - point.x, self.y - point.y)
    }
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

extension CGSize {
    static func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
}
