//
//  ViewController.swift
//  Tip Calculator 2
//
//  Created by Alexandra Kelly  on 10/5/16.
//  Copyright © 2016 Alexandra Kelly . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var fifteenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var twentyFivePercent: UIButton!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    var tipPercent = 0.0
    var splitNumber = 1
    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greenImage")!)
    }
    func resetButton() {
        tenPercent.backgroundColor = UIColor(patternImage: UIImage(named: "10Unselected")!)
        fifteenPercent.backgroundColor = UIColor(patternImage: UIImage(named: "15Unselected")!)
        twentyPercent.backgroundColor = UIColor(patternImage: UIImage(named: "20Unselected")!)
        twentyFivePercent.backgroundColor = UIColor(patternImage: UIImage(named: "25Unselected")!)
    }
    @IBAction func tenpercentButton(_ sender: UIButton) {
        resetButton()
        tenPercent.backgroundColor = UIColor(patternImage: UIImage(named: "10Selected")!)
        tipPercent = 0.10
        calculate(tipPercent)
    }
    @IBAction func fifteenpercentButton(_ sender: UIButton) {
        resetButton()
        fifteenPercent.backgroundColor = UIColor(patternImage: UIImage(named: "15Selected")!)
        tipPercent = 0.15
        calculate(tipPercent)
    }
    @IBAction func twentyPercentButton(_ sender: UIButton) {
        resetButton()
        twentyPercent.backgroundColor = UIColor(patternImage: UIImage(named: "20Selected")!)
        tipPercent = 0.20
        calculate(tipPercent)
    }
    @IBAction func twentyFivePercentButton(_ sender: UIButton) {
        resetButton()
        twentyFivePercent.backgroundColor = UIColor(patternImage: UIImage(named: "25Selected")!)
        tipPercent = 0.25
        calculate(tipPercent)
    }
    func calculate (_ p: Double) {
        print(billAmountTextField.text!.characters.count)
        if let amount = Double(billAmountTextField.text!) {
            let tip = (amount * p) / Double(splitNumber)
            let totalPay = (amount / Double(splitNumber)) + tip
            tipLabel.text = String(format:"$%.2f", tip)
            totalAmountLabel.text = String(format: "$%.2f", totalPay)
            billAmountTextField.resignFirstResponder()
        }
    }
    @IBAction func upArrowButton(_ sender: UIButton) {
        splitNumber += 1
        numberOfPeopleLabel.text = "\(splitNumber)"
        calculate(tipPercent)
    }
    @IBAction func downArrowButton(_ sender: UIButton) {
        
        if  splitNumber > 1  {
        splitNumber -= 1
        numberOfPeopleLabel.text = "\(splitNumber)"
        calculate(tipPercent)
        }
    }
}
    


