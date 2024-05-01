//
//  ViewController.swift
//  HesapMakinesi
//
//  Created by Nazife Tekin on 23.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operation = ""
    var result : Double = 0
    var isTypingNumber = false // kullanıcının bir sayı yazıp yazmadığını takip eder.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func operations(_ sender: UIButton) {
        
        operation = sender.titleLabel!.text!
        firstNumber = Double(resultLabel.text!)!
        resultLabel.text = ""
        
    }
    
    @IBAction func numbersButton(_ sender: UIButton) {
        
        if resultLabel.text == "0"  {
            resultLabel.text = ""
        }
        
        resultLabel.text = resultLabel.text! + String(sender.tag)
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        resultLabel.text = "0"
        isTypingNumber = false
        firstNumber = 0
        operation = ""
    }
    
    @IBAction func commaButton(_ sender: UIButton) {
        
        //Birden fazla virgül eklenemez ve ekrandaki sıfırı ondalıklı yapabilirim
        if resultLabel.text!.isEmpty || resultLabel.text! == "0" {
               resultLabel.text = "0."
           } else if !resultLabel.text!.contains(".") {
               resultLabel.text = resultLabel.text! + "."
           }
           isTypingNumber = true
        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        //sıfıra bölmelerde çökme durumu olma
        let secondNumber = Double(resultLabel.text!)!
        if operation == "/" && secondNumber == 0 {
                    resultLabel.text = "Error: Division by zero"
                }
        else{
            switch operation {
            case "+":
                resultLabel.text = String(firstNumber + secondNumber)
            case "-":
                resultLabel.text = String(firstNumber - secondNumber)
            case "x":
                resultLabel.text = String(firstNumber * secondNumber)
            case "/":
                resultLabel.text = String(firstNumber / secondNumber)
                
            case "%":
                resultLabel.text = String(firstNumber * secondNumber / 100)
            default:
                break
            }
        }
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        
        resultLabel.text = resultLabel.text!.isEmpty ? "-" : (resultLabel.text!.first! == "-" ? String(resultLabel.text!.dropFirst()) : "-" + resultLabel.text!)
        
    }
}
