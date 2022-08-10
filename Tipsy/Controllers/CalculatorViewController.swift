//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var billPerPerson = "0.0"
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper){
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if(zeroPctButton.isSelected == true){
            billPerPerson = String((Float(billTextField.text!)!)/Float(splitNumberLabel.text!)!)
        }
        else if(tenPctButton.isSelected == true){
            billPerPerson = String((Float(billTextField.text!)! * 5.5 / 5.0)/Float(splitNumberLabel.text!)!)
        }
        else if(twentyPctButton.isSelected == true){
            billPerPerson = String(((Float(billTextField.text!)! * 6 / 5.0))/Float(splitNumberLabel.text!)!)
        }
        //print(splitNumberLabel.text!)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.billPerPerson = billPerPerson
                destinationVC.person = splitNumberLabel.text
                if(zeroPctButton.isSelected == true){
                    destinationVC.tip = "0%"
                }
                else if(tenPctButton.isSelected == true){
                    destinationVC.tip = "10%"
                }
                else if(twentyPctButton.isSelected == true){
                    destinationVC.tip = "20%"
                }
                
            }
        }
    
    
}

