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
    @IBOutlet weak var defaultColor: UISegmentedControl!
    
    var tipValue = 0
    var colorValue: Int = 0
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDefault()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveUserDefault(_ sender: AnyObject) {
        
        
        //defaults.set("some_string_to_save", forKey: "Some_key_that_you_choose")
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "defaultTipPercentage")
        defaults.synchronize()
        
    }
    
    @IBAction func saveDefaultColor(_ sender: AnyObject) {

        defaults.set(defaultColor.selectedSegmentIndex, forKey: "defaultColor")
        defaults.synchronize()
        self.viewDidLoad()
    }
    
    
    func loadUserDefault() {
        let colors = [UIColor.purple, UIColor.green, UIColor.orange]
        let defaults = UserDefaults.standard
        
        tipValue = defaults.integer(forKey: "defaultTipPercentage")
        defaultTip.selectedSegmentIndex = tipValue
        
        colorValue = defaults.integer(forKey: "defaultColor")
        defaultColor.selectedSegmentIndex = colorValue
        
        self.view.backgroundColor = colors[colorValue]
        
    }
    
 }
