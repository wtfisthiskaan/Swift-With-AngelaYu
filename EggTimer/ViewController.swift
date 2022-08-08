//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    let eggTimes = ["Soft": 100, "Medium": 420,"Hard": 720]

    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //print(sender.currentTitle)
        let hardness = sender.currentTitle!
        
        print(eggTimes[hardness]!)
        
        barProgress.progress = 0
        
    }
    
    var timer = Timer()
    

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBAction func startTimer(_ sender: UIButton) {
        timer.invalidate()
        var secondsRemaining = eggTimes[sender.currentTitle!]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in if secondsRemaining > 0 {
                //print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            let percentage = Float(secondsRemaining) / Float(self.eggTimes[sender.currentTitle!]!)
            print("\(percentage)  \(secondsRemaining)  \(self.eggTimes[sender.currentTitle!]!)  ")
            self.barProgress.progress = percentage
            }
        }
        
        mainLabel.text = "Done"
}
    
}
