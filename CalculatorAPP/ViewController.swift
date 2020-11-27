//
//  ViewController.swift
//  CalculatorAPP
//
//  Created by prikshit soni on 18/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0.0
    var PrevNumber : Double = 0.0
    var operation = 0
    var calculating = false
    var haveDeci = false
    var IsFirstInput = true
    var haveOpr = false

    @IBOutlet weak var result: UILabel!
    
    @IBAction func number(_ sender: Any){
        
        let Decimal = CharacterSet(charactersIn: ".")
        if result.text?.rangeOfCharacter(from: Decimal) != nil
        {
            haveDeci = true
        }
        else
        {
            haveDeci = false
        }
        
        if((sender as! UIButton).tag == 17 )
        {
            if(!haveDeci)
            {
                result.text = result.text! + String(".")
                haveDeci = true
                IsFirstInput = false
            }
            else
            {
                print("already have a decimal")
            }

        }
        else
        {
            if(calculating)
               {
                result.text = String((sender as! UIButton).tag-1)
                numberOnScreen = Double(result.text!)!
                calculating = false
                IsFirstInput = false
                haveOpr = false
               }
               else
               {
                result.text = result.text! + String((sender as! UIButton).tag-1)
                numberOnScreen = Double(result.text!)!
                IsFirstInput = false
                haveOpr = false
               }
            
        }
        
     
        
    }

    @IBAction func operation(_ sender: UIButton) {
        
        if(!IsFirstInput && haveOpr==false)
        {
            PrevNumber = Double(result.text!)!
           
            if (sender.tag == 12)
            {
                result.text = "%"
            }
            else if (sender.tag == 13)
            {
                result.text = "/"
            }
            else if (sender.tag == 14)
            {
                result.text = "X"
            }
            else if (sender.tag == 16)
            {
                result.text = "+"
            }
            haveOpr = true
            operation = sender.tag
            IsFirstInput = false
            calculating = true
            
        }
        else if(sender.tag == 15)
        {
            result.text = "-"
            haveOpr = true
        }
        
    }
    
    @IBAction func execute(_ sender: Any) {
        
        if(operation == 11)
        {
            result.text = String()
        }
        else if (operation == 12)
        {
            result.text = String(PrevNumber / 100 * numberOnScreen)
            
        }
        else if (operation == 13)
        {
            result.text = String(PrevNumber / numberOnScreen)
            
        }
        else if (operation == 14)
        {
            result.text = String(PrevNumber * numberOnScreen)
            
        }
        else if (operation == 15)
        {
            result.text = String(PrevNumber - numberOnScreen)
            
        }
        else if (operation == 16)
        {
            result.text = String(PrevNumber + numberOnScreen)
            
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        result.text = ""
        operation = 0
        haveDeci = false
        IsFirstInput = true
        haveOpr = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view.
    }


}

