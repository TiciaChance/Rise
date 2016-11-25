//
//  TimerVC.swift
//  Morning Rise
//
//  Created by Laticia Chance on 11/24/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import UICircularProgressRing

class TimerVC: UIViewController, UICircularProgressRingDelegate {
    
    var myTimer : Timer!
    
    var minutes = 10
    var seconds = 0
    var fractions = 100
    
    var timerString = ""
    
    //button reappears
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var ring1: UICircularProgressRingView!
    @IBOutlet weak var ring2: UICircularProgressRingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownLabel.text = "10:00"
        
        ring1.delegate = self
        ring2.delegate = self
        
        ring1.animationStyle = kCAMediaTimingFunctionLinear
    }

    @IBAction func startBtnTapped(_ sender: Any) {
        
        startTimer()
        ringAnimation()
        self.startBtn.isHidden = true
    }
    
    
    func startTimer() {
       myTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector (TimerVC.timerRunning), userInfo: nil, repeats: true)
    }
    

    func ringAnimation() {
        ring1.animationStyle = kCAMediaTimingFunctionLinear
        ring1.setProgress(99, animationDuration: 10, completion: nil)
        
        ring2.setProgress(100, animationDuration: 6_000)
        
//        ring2.setProgress(50, animationDuration: 625) {
//            // Increase it more, and customize some properties
//            self.ring2.viewStyle = 4
//            self.ring2.setProgress(100, animationDuration: 625) {
//                self.ring2.fontSize = 70
//                print("Ring 2 finished")
        
//            }
//}

    }
    
    func finishedUpdatingProgress(_ forRing: UICircularProgressRingView) {
        if forRing === ring1 {
            print("From delegate: Ring 1 finished")
        } else if forRing === ring2 {
            print("From delegate: Ring 2 finished")
        }
    }

    func timerRunning() {
        
        fractions -= 1
        if fractions == 0 {
            seconds -= 1
            fractions = 100
        }
        
        if seconds == 0 && minutes != 0 {
            minutes -= 1
            seconds = 59
        }
        
        if seconds == 0 && minutes == 0 {
            myTimer.invalidate()
            
        }
        
        //let fractionString = fractions < 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutessString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        timerString = "\(minutessString): \(secondsString)"
        countdownLabel.text = timerString
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
