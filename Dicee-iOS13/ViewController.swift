//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //reference UI element
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1 : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    //image literal = #imageliteral(
    
    var leftDiceNumber = 0
    
    var rightDiceNumber = 5
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //random nums created
        leftDiceNumber = Int.random(in: 0...5)
        rightDiceNumber = Int.random(in: 0...5)
        
        //dice array assigned
        let diceArr = [ #imageLiteral(resourceName: "DiceOne") , #imageLiteral(resourceName: "DiceTwo") , #imageLiteral(resourceName: "DiceThree") , #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

        //random dice shows on image
        diceImageView1.image =  diceArr[leftDiceNumber]
        diceImageView2.image =  diceArr[rightDiceNumber]
       
        
    }
    
    
}

