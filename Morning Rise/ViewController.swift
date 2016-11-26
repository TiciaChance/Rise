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
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteBtn: UIButton!
    
    @IBAction func labelBtnTapped(_ sender: Any) {
        
        authorLabel.isHidden = false
        quoteBtn.isHidden = true
        
        self.quoteLabel.text = self.quotes.quote
        
        
        self.authorLabel.text = " -\(self.quotes.author)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quotes.APICall()
        quoteLabel.text = "Click Below For Daily Quote"
        authorLabel.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

