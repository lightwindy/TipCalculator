//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Roy Yin on 9/16/16.
//  Copyright © 2016 Roy Yin. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitPeople: UILabel!
    
    var tipValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDefault()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
        loadUserDefault()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear")
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
       print("hello!")
       view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.20]
        billField.textAlignment = .right
        billField.placeholder = "Enter The Amount"
        billField.clearsOnBeginEditing = .init(true)
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let people = Int(splitSlider.value)
        let split = total / Double(people)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitPeople.text = String(format: "%i", people)
        splitLabel.text = String(format: "$%.2f", split)
    }

    func loadUserDefault() {
        let colors = [UIColor.purple, UIColor.green, UIColor.orange]
        let defaults = UserDefaults.standard
        
        tipValue = defaults.integer(forKey: "defaultTipPercentage")
        tipControl.selectedSegmentIndex = tipValue
        calculateTip(tipControl)
        
        let colorValue = defaults.integer(forKey: "defaultColor")
        self.view.backgroundColor = colors[colorValue]
        
    }
    
}

