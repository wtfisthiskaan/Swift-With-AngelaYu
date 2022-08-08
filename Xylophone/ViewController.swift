//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("Start")
        sender.alpha = 0.5
        playSound(soundLetter: sender.currentTitle!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { print("Finish")
        }
    }
    
    func playSound(soundLetter: String) {
        let url = Bundle.main.url(forResource: soundLetter, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}


