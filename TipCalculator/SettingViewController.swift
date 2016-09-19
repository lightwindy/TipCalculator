//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Roy Yin on 9/16/16.
//  Copyright © 2016 Roy Yin. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    var tipValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDefault()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveUserDefault(_ sender: AnyObject) {
        
        let defaults = UserDefaults.standard
        //defaults.set("some_string_to_save", forKey: "Some_key_that_you_choose")
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "defaultTipPercentage")
        defaults.synchronize()
        
    }
    
    func loadUserDefault() {
        
        let defaults = UserDefaults.standard
        tipValue = defaults.integer(forKey: "defaultTipPercentage")
        defaultTip.selectedSegmentIndex = tipValue
        
    }
    
 }
