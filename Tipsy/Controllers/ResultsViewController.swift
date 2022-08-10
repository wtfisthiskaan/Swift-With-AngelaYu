//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kaan Uslu on 9.08.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    // Split between 2 people, with 10% tip.
    var billPerPerson: String?
    var person: String?
    var tip: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billPerPerson
        settingsLabel.text = "Split between "
        settingsLabel.text?.append(contentsOf: person!)
        settingsLabel.text?.append(contentsOf: " people, with ")
        settingsLabel.text?.append(contentsOf: tip!)
        settingsLabel.text?.append(contentsOf: " tip.")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
