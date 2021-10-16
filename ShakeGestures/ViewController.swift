//
//  ViewController.swift
//  ShakeGestures
//
//  Created by Jisa Gigi on 10/16/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startGameBtn: UIButton!
    var timer = Timer()
    
    var timeInt = 10
    var scoreInt = 0
    var imageInt = 1
    var modeInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func startGame(_ sender: Any) {
        if timeInt == 0{
            timeInt = 10
            scoreInt = 0
            scoreLabel.text = String(0)
            timeLabel.text = String(timeInt)
            imageView.image = UIImage(named: "Face1")
            startGameBtn.setTitle("Start Game", for: .normal)

        }
        
        if timeInt == 10{
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter),userInfo: nil,repeats: true)
            startGameBtn.setTitle("Shake Me", for: .normal)

        modeInt = 1
        }
        startGameBtn.isEnabled = false
        startGameBtn.alpha = 0.25
    }
    @objc func startCounter(){
        timeInt -= 1
        
        timeLabel.text = String(timeInt)
        if timeInt == 0 {
            timer.invalidate()
            modeInt = 0
            startGameBtn.isEnabled = true
            startGameBtn.alpha = 1
            startGameBtn.setTitle("Restart", for: .normal)
        }
        
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if modeInt == 1{
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                imageInt += 1
                if imageInt == 12 {
                    imageInt = 1
                }
                imageView.image = UIImage(named: "Face\(self.imageInt)")
            }
        }
    }
    
}

