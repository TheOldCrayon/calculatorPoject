//
//  ViewController.swift
//  daCalculatore
//
//  Created by Marek Neumarker on 9/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    var displayNumber: Double = 0
    var heldNumber: Double = 0
    var calculating: Bool = true
    var operation = 0
    // true means positive false means negative
    var sign = true
    

    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var numberTextArea: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func buttonColorChange() {
        subtractButton.tintColor = UIColor.systemIndigo
        additionButton.tintColor = UIColor.systemIndigo
        multiplyButton.tintColor = UIColor.systemIndigo
        divisionButton.tintColor = UIColor.systemIndigo
    }
    
    @IBAction func functionButtons(_ sender: UIButton) {
        if numberTextArea.text != "" &&  sender.tag != 11 &&  sender.tag != 12 && sender.tag != 13 && sender.tag != 18 && sender.tag != 19{
            heldNumber = Double(numberTextArea.text!)!
            switch sender.tag {
            case 14:
                // division
                buttonColorChange()
                sender.tintColor = UIColor.systemGray
                operation = sender.tag
            case 15:
                // multiplication
                buttonColorChange()
                sender.tintColor = UIColor.systemGray
                operation = sender.tag
            case 16:
                // addition
                buttonColorChange()
                sender.tintColor = UIColor.systemGray
                operation = sender.tag
            case 17:
                // subtraction
                buttonColorChange()
                sender.tintColor = UIColor.systemGray
                operation = sender.tag
            default:
                sender.tintColor = UIColor.systemIndigo
            }
            operation = sender.tag
            calculating = true
        } else if sender.tag == 18 {
            switch operation {
            case 14:
                let divisionAnswer = heldNumber / displayNumber
                if divisionAnswer == floor(divisionAnswer) {
                    numberTextArea.text = String(Int(divisionAnswer))
                } else {
                    numberTextArea.text = String(format: "%\(Decimal(divisionAnswer))", divisionAnswer)
                }
            case 15:
                let multiplicationAnswer = displayNumber * heldNumber
                if multiplicationAnswer == floor(multiplicationAnswer) {
                    numberTextArea.text = String(Int(displayNumber * heldNumber))
                } else {
                    numberTextArea.text = String(format: "%\(Decimal(multiplicationAnswer))", multiplicationAnswer)
                }
            case 16:
                let additionAnswer = displayNumber + heldNumber
                if additionAnswer == floor(additionAnswer) {
                    numberTextArea.text = String(Int(displayNumber + heldNumber))
                } else {
                    numberTextArea.text = String(format: "%\(Decimal(additionAnswer))", additionAnswer)
                }
            case 17:
                let subtractAnswer = heldNumber - displayNumber
                if subtractAnswer == floor(subtractAnswer) {
                    numberTextArea.text = String(Int(heldNumber - displayNumber))
                } else {
                    numberTextArea.text = String(format: "%\(Decimal(subtractAnswer))", subtractAnswer)
                }
            default:
                numberTextArea.text = "0"
            }
            buttonColorChange()
            operation = 0
            calculating = true
        } else if sender.tag == 12 {
            displayNumber *= -1
            if sign == true {
                sign = false
                numberTextArea.text = String(displayNumber)
            } else {
                sign = true
                numberTextArea.text = String(displayNumber)
            }
        } else if sender.tag == 13 {
            displayNumber *= 0.01
            numberTextArea.text = String(displayNumber)
        }  else if sender.tag == 19 {
            numberTextArea.text = String(Int(displayNumber)) + "."
        } else if sender.tag == 11 {
            if calculating == false {
                displayNumber = 0
                numberTextArea.text = ""
                calculating = true
            } else {
                displayNumber = 0
                heldNumber = 0
                numberTextArea.text = ""
                operation = 0
                buttonColorChange()
            }
            

        }
    }
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if calculating == true {
            clearButton.titleLabel?.text = "C"
            numberTextArea.text = String(sender.tag - 1)
            displayNumber = Double(numberTextArea.text!)!
            calculating = false
        } else {
            numberTextArea.text = numberTextArea.text! + String(sender.tag-1)
            displayNumber = Double(numberTextArea.text!)!
        }
    }

}

