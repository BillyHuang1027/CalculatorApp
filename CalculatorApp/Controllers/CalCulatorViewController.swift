//
//  CalCulatorViewController.swift
//  CalculatorApp
//
//  Created by 黃昌齊 on 2021/7/30.
//

import UIKit

class CalCulatorViewController: UIViewController {
    
    var dialFirstDigit = true
    var result = 0
    var equation = ""

    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var factorialButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.text = "0"
        numberLabel.adjustsFontSizeToFitWidth = true //字體自動調整大小
        
    }
    
    @IBAction func pressNumber(_ sender: UIButton) {
        var inputNum = sender.tag
        //判斷是否輸入第一位數
        if dialFirstDigit == true {
            numberLabel.text = String(inputNum)
            dialFirstDigit = false
        } else {
            //判斷第一位數是否為0
            if numberLabel.text != "0" {
                numberLabel.text! += String(inputNum)
            } else {
                numberLabel.text = ""
                numberLabel.text! += String(inputNum)
            }
        }
        print(numberLabel.text)
    }
    
    @IBAction func calculateNums(_ sender: UIButton) {
        guard let inputNum = numberLabel.text else { return }
        switch sender.tag {
        case 0: //歸零
            result = 0
            numberLabel.text = "0"
            equation = ""
        case 1: //階乘
            result = 1
            if let factorialNum = Int(numberLabel.text!) {
                if factorialNum != 0 {
                    for num in 1...factorialNum {
                        result *= num
                    }
                }
            }
            numberLabel.text = String(result)
        case 2: //除
            equation += inputNum + ".0/"
        case 3: //乘
            equation += inputNum + ".0*"
        case 4: //減
            equation += inputNum + ".0-"
        case 5: //加
            equation += inputNum + ".0+"
        default:
            break
        }
        dialFirstDigit = true
        print(equation)
    }
    
    @IBAction func equl(_ sender: Any) {
        if let inputNum = numberLabel.text {
            equation += inputNum
            print(equation)
        }
        let expression = NSExpression(format: equation)
        if let calculateResult = expression.expressionValue(with: nil, context: nil) as? Double {
            print(calculateResult)
            if calculateResult.truncatingRemainder(dividingBy: 1) == 0 {
                numberLabel.text = String(calculateResult.floor(toInteger: 1))
            } else {
                numberLabel.text = String(calculateResult.rounding(toDecimal: 6))
            }
        }
        dialFirstDigit = true
        equation = ""
    }
    
}
