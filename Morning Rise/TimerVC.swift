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
        
        //0.0055 for simulator
        myTimer = Timer.scheduledTimer(timeInterval: 0.010, target: self, selector: #selector (TimerVC.timerRunning), userInfo: nil, repeats: true)
    }
    
    
    func ringAnimation() {
        
        //i think 625 animation duration for simulator
        ring1.animationStyle = kCAMediaTimingFunctionLinear
        ring1.setProgress(99, animationDuration: 20, completion: nil)
        //
        ring2.setProgress(100, animationDuration: 600)
        
        
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
            seconds = 60
        }
        
        if seconds == 0 && minutes == 0 {
            myTimer.invalidate()
            alert()
            
        }
        
        //let fractionString = fractions < 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutessString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        
        timerString = "\(minutessString): \(secondsString)"
        countdownLabel.text = timerString
        
    }
    
    func alert() {
        let alertController = UIAlertController(title: "Your Meditation is Done", message: "Enjoy Your Day!", preferredStyle: .alert)
        
        let submitError = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(submitError)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
