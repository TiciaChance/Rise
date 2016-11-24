//
//  ViewController.swift
//  Rise
//
//  Created by Laticia Chance on 11/23/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Picker Views
    
    @IBOutlet weak var firstPickerView: UIPickerView!
    
    @IBOutlet weak var secondPickerView: UIPickerView!
    
    @IBOutlet weak var thirdPickerView: UIPickerView!
    
    // Buttons
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    
    
    let options = ["Journal", "Meditate", "Read", "Movement", "Eat Well"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstPickerView.dataSource = self
        firstPickerView.delegate = self
        
        secondPickerView.dataSource = self
        secondPickerView.delegate = self
        
        thirdPickerView.dataSource = self
        thirdPickerView.delegate = self
        
    }
    
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        
        
    }
    
    
    @IBAction func thirdButtonTapped(_ sender: Any) {
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        if pickerView == firstPickerView {
            
            firstBtn.setTitle(options[row], for: .normal)
            firstPickerView.isHidden = true
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

