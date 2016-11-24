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
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the view
        let progressRing = UICircularProgressRingView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        
        // Change any of the properties you'd like
//        progressRing.maxValue = 50
//        progressRing.innerRingColor = UIColor.blue
        
        // etc ...
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector (TimerVC.timerRunning), userInfo: nil, repeats: true)
    }
    
    func timerRunning() {
        
        countdownLabel.text = "\(timeLeft)"
        
        timeLeft -= 0.1
        if timeLeft == 0 {
            countdownLabel.text = "Time For Your Next Activity"
            myTimer.invalidate()
        }
        
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
