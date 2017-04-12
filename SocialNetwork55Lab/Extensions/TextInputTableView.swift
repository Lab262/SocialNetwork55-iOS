//
//  TextInputTableView.swift
//  SocialNetwork55Lab
//
//  Created by Luís Resende on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class TextInputTableView: UITableView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        
        let showKeyboardBlock = { (notification: Notification) in
            
            if let  obj = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] {
                var keyboardFrame = CGRect.null
                
                if (obj as AnyObject).responds(to: #selector(NSValue.getValue(_:))) {
                    (obj as AnyObject).getValue(&keyboardFrame)
                    UIView.animate(
                        withDuration: 0.25,
                        delay: 0.0,
                        options: UIViewAnimationOptions(),
                        animations: {
                            () -> Void in
                            self.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardFrame.size.height + 15, 0.0)
                    },
                        completion: nil)
                }
            }
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (notification) in
            
            showKeyboardBlock(notification)
        }
        
        let hideKeyboardBlock = {
            
            UIView.animate(
                withDuration: 0.25,
                delay: 0.0,
                options: UIViewAnimationOptions(),
                animations: {
                    () -> Void in
                    self.contentInset = UIEdgeInsets.zero
            },
                completion: nil)
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (notification) in
            
            hideKeyboardBlock()
        }
        
    }

}
