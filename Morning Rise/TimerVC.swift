//
//  TimerVC.swift
//  Morning Rise
//
//  Created by Laticia Chance on 11/24/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import UICircularProgressRing

class TimerVC: UIViewController {
    
    var timeLeft = 10.00
    var myTimer : Timer!
    
    var minutes = 0
    var seconds = 0
    var fractions = 0
    
    var timerString = ""
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the view
        let progressRing = UICircularProgressRingView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        
        // Change any of the properties you'd like
//        progressRing.maxValue = 50
//        progressRing.innerRingColor = UIColor.blue
        
        // etc ...
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector (TimerVC.timerRunning), userInfo: nil, repeats: true)
    }
    
    func timerRunning() {
        
        countdownLabel.text = "\(timeLeft)"
        
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }

        let fractionString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutessString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        timerString = "\(minutessString): \(secondsString)"
        
        countdownLabel.text = timerString

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
