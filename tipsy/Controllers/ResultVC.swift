//
//  ResultVC.swift
//  tipsy
//
//  Created by Josh Courtney on 4/27/21.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var totalPerPerson: String?
    var details: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalPerPerson
        detailsLabel.text = details
    }
    
    @IBAction func recalculateBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
