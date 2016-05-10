//
//  KeyboardViewController.swift
//  MyKeyboard
//
//  Created by wilab on 16/5/9.
//  Copyright (c) 2016年 wilab. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, keyboardDelegate {



    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        
        let keyboard: KB? = NSBundle.mainBundle().loadNibNamed("KB", owner: nil, options: nil).last as? KB;
        keyboard?.delegate = self
        keyboard?.frame = view.frame
        //keyboard?.sizeToFit()
        self.view.addSubview(keyboard!);
        let leftConstraint = NSLayoutConstraint(item: keyboard!, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let bottomConstrait = NSLayoutConstraint(item: keyboard!, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: keyboard!, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: keyboard!, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([leftConstraint, bottomConstrait, topConstraint, rightConstraint])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy 
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }

    }
    
    func insert(item: NSString) {
        (self.textDocumentProxy ).insertText(item as String)
    }

    func delete() {
        (self.textDocumentProxy ).deleteBackward()
    }
    
    func enter() {
        (self.textDocumentProxy ).insertText("\n")
    }
    
    func next() {
        advanceToNextInputMode()
    }
}
