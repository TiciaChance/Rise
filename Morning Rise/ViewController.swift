//
//  ViewController.swift
//  Rise
//
//  Created by Laticia Chance on 11/23/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quotes = QuotesAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quotes.APICall()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

