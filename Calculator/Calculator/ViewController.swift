//
//  ViewController.swift
//  Calculator
//
//  Created by Rydge on 2/1/15.
//  Copyright (c) 2015 SHU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var UserIsInTheMiddleOfTyping:Bool=false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit=sender.currentTitle!
        println("the digit is \(digit)")
        
        if UserIsInTheMiddleOfTyping{
            display.text = display.text! + digit
        }
        else{
            display.text=digit
            UserIsInTheMiddleOfTyping=true
        }
        
    }

    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        UserIsInTheMiddleOfTyping=false
        operandStack.append(display.text!)
    }
    
    var displayValue:Double{
        get
        {
            
        }
        
        set
        {
            display.text="\(newValue)"
        }
    }

}

