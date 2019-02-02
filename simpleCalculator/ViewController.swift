//
//  ViewController.swift
//  simpleCalculator
//
//  Created by omar Elbanby on 2019-02-01.
//  Copyright © 2019 omar Elbanby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let PLUS = 10
    let MINUS = 11
    let MULTIPLY = 12
    let DIVIDE = 13
    
    @IBOutlet var lblText : UILabel!
    var num1 : NSInteger = 0
    var num2 : NSInteger = 0
    var operand : NSInteger = 0
    var result : Double = 0.0
    var number : String = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printNumber()
    }

    func printNumber() {
        lblText.text = number
    }
    
    func saveNum1() {
        num1 = Int(number)!
        number = "0"
        printNumber()
    }
    
    @IBAction func pressNumber(sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            number += String(sender.tag)
            printNumber()
        }
    }
    
    @IBAction func setOpperand(sender: UIButton) {
        if sender.tag >= 10 && sender.tag <= 13 {
            operand = sender.tag
            saveNum1()
        }
        
        if sender.tag == -2 {
            number = "0"
            printNumber()
        }
    }

    @IBAction func calculate(sender: UIButton) {
        num2 = Int(number)!
    
        switch(operand) {
        case PLUS: result = Double(num1 + num2);
        case MINUS: result = Double(num1 - num2);
        case MULTIPLY: result = Double(num1 * num2);
        case DIVIDE: result = Double(num1) / Double(num2);
        default: break
        }
        
        if result.isInfinite {
            result = 0
            
            // Cretae alert box
            let alert = UIAlertController(title: "Error", message: "Can't divide by zero", preferredStyle: .alert)
            
            // create buttons
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            // join butons to alert box
            alert.addAction(cancelAction)
            
            // display the alert box
            present(alert, animated: true)
        }
        
        
        num1 = 0
        num2 = 0
        operand = PLUS
        number = String(result)
        printNumber()
        result = 0.0
        number = "0"
    }
    
}

