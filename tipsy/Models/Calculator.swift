//
//  Calculator.swift
//  tipsy
//
//  Created by Josh Courtney on 4/28/21.
//

import Foundation

struct Calculator {
    func getTotalPerPerson(bill: Float, tip: Float, split: Int) -> String {
        let totalBill = (bill * tip) + bill
        let totalPerPerson = totalBill / Float(split)
        
        return String(format: "%.2f", totalPerPerson)
    }
}
