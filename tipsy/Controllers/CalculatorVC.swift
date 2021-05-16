//
//  ViewController.swift
//  tipsy
//
//  Created by Josh Courtney on 4/27/21.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentBtn: UIButton!
    @IBOutlet weak var tenPercentBtn: UIButton!
    @IBOutlet weak var twentyPercentBtn: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    let calculator = Calculator()
    
    var bill: Float = 0
    var tip: Float = 0
    var split: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResultVC" {
            let destinationVC = segue.destination as! ResultVC
            
            destinationVC.details = "Split between \(split) people, with \(tip)% tip"
            destinationVC.totalPerPerson = calculator.getTotalPerPerson(
                bill: bill,
                tip: tip,
                split: split
            )
        }
    }
    
    @IBAction func percentBtnTapped(_ sender: UIButton) {
        billTextField.endEditing(true)
        updateBill()
        
        zeroPercentBtn.isSelected = false
        tenPercentBtn.isSelected = false
        twentyPercentBtn.isSelected = false
        
        if sender.tag == 1 {
            zeroPercentBtn.isSelected = true
            tip = 0
        } else if sender.tag == 2 {
            tenPercentBtn.isSelected = true
            tip = 0.1
        } else {
            twentyPercentBtn.isSelected = true
            tip = 0.2
        }
    }
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        split = Int(sender.value)
        splitLabel.text = "\(split)"
    }
    
    @IBAction func calculateBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToResultVC", sender: self)
    }
    
    func updateBill() {
        guard let billString = billTextField.text else { return }
        guard let billFloat = Float(billString) else  { return }
        
        bill = billFloat
    }
    
}
