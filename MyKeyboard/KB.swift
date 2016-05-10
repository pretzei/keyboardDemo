//
//  KB.swift
//  Demo
//
//  Created by wilab on 16/5/9.
//  Copyright (c) 2016年 wilab. All rights reserved.
//

import UIKit

protocol keyboardDelegate {
    func insert(item : NSString)
    
    func delete()
    
    func enter()
    
    func next()
}

class KB: UIView {
    internal var delegate : keyboardDelegate?
    
    @IBOutlet var key: [UIButton]!

    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */


    @IBAction func insertTouch(sender: UIButton) {
        delegate?.insert(sender.titleLabel!.text!)
    }

    @IBAction func deleteTouch(sender: UIButton) {
        delegate?.delete()
    }
    @IBAction func enterTouch(sender: UIButton) {
        delegate?.enter()
    }
    
    @IBAction func nextTouch(sender: AnyObject) {
        delegate?.next()
    }
    
   
    @IBAction func convertTouch(sender: UIButton) {
        if (sender.tag == 0) {
            for item in key {
                item.setTitle(item.titleLabel?.text?.uppercaseString, forState: .Normal)
            }
            sender.tag = 1
        } else {
            for item in key {
                item.setTitle(item.titleLabel?.text?.lowercaseString, forState: .Normal)
                
            }
            sender.tag = 0
        }
        
    }
}
