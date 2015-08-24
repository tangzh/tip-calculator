//
//  SettingsViewController.swift
//  tip
//
//  Created by Tang Zhang on 8/23/15.
//  Copyright (c) 2015 Tang Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var per1Label: UITextField!
    @IBOutlet weak var per2Label: UITextField!
    @IBOutlet weak var per3Label: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    func setPercentages() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var percentage1 = defaults.doubleForKey("percentage1")
        var percentage2 = defaults.doubleForKey("percentage2")
        var percentage3 = defaults.doubleForKey("percentage3")
        
        if(percentage1 > 0) {
            tipPercentages[0] = percentage1
        }
        
        if(percentage2 > 0) {
            tipPercentages[1] = percentage2
        }
        
        if(percentage3 > 0) {
            tipPercentages[2] = percentage3
        }
        
        per1Label.text = "\(tipPercentages[0])"
        tipControl.setTitle("\(tipPercentages[0])", forSegmentAtIndex: 0)
        per2Label.text = "\(tipPercentages[1])"
        tipControl.setTitle("\(tipPercentages[1])", forSegmentAtIndex: 1)
        per3Label.text = "\(tipPercentages[2])"
        tipControl.setTitle("\(tipPercentages[2])", forSegmentAtIndex: 2)
        
        var defaultIndex = defaults.integerForKey("defaultIndex")
        tipControl.selectedSegmentIndex = defaultIndex
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setPercentages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeSettingsPage(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func changePer1(sender: AnyObject) {
        tipPercentages[0] = per1Label.text._bridgeToObjectiveC().doubleValue
    }
    
    
    @IBAction func changePer2(sender: AnyObject) {
        tipPercentages[1] = per2Label.text._bridgeToObjectiveC().doubleValue
    }
    
    
    
    @IBAction func changePer3(sender: AnyObject) {
        tipPercentages[2] = per3Label.text._bridgeToObjectiveC().doubleValue
    }
    
    @IBAction func saveChanges(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentages[0], forKey: "percentage1")
        defaults.setDouble(tipPercentages[1], forKey: "percentage2")
        defaults.setDouble(tipPercentages[2], forKey: "percentage3")
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultIndex")
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
