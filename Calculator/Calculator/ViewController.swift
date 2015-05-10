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
    
    @IBAction func operate(sender: UIButton) {
        let operation=sender.currentTitle!
        if UserIsInTheMiddleOfTyping{
            enter()
        }
        switch operation
        {
        case "×":
            if operandStack.count>=2
            {
                displayValue=operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
        case "÷":
            if operandStack.count>=2
            {
                displayValue=operandStack.removeLast() / operandStack.removeLast()
                enter()
            }
        case "+":
            if operandStack.count>=2
            {
                displayValue=operandStack.removeLast() + operandStack.removeLast()
                enter()
            }
        case "−":
            if operandStack.count>=2
            {
                displayValue=operandStack.removeLast() - operandStack.removeLast()
                enter()
            }
        default:
            break
        }
        
    }
    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        UserIsInTheMiddleOfTyping=false
        operandStack.append(displayValue)
        println("operandSatck:  \(operandStack)")
    }
    
    var displayValue:Double{
        get
        {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set
        {
            display.text="\(newValue)"
            UserIsInTheMiddleOfTyping=false;
        }
    }

}

