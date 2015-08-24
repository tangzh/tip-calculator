//
//  ViewController.swift
//  tip
//
//  Created by Tang Zhang on 8/23/15.
//  Copyright (c) 2015 Tang Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    func setPercentages() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var percentage1 = defaults.doubleForKey("percentage1")
        var percentage2 = defaults.doubleForKey("percentage2")
        var percentage3 = defaults.doubleForKey("percentage3")
        
        if(percentage1 > 0) {
            tipPercentages[0] = percentage1
            tipControl.setTitle("\(percentage1)", forSegmentAtIndex: 0)
        }
        
        if(percentage2 > 0) {
            tipPercentages[1] = percentage2
            tipControl.setTitle("\(percentage2)", forSegmentAtIndex: 1)
        }
        
        if(percentage3 > 0) {
            tipPercentages[2] = percentage3
            tipControl.setTitle("\(percentage3)", forSegmentAtIndex: 2)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setPercentages()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

