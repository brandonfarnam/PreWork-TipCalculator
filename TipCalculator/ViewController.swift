//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nguyen, Khang on 1/23/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentages = [0.15, 0.18, 0.20]
    static let sharedInstance = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        let defaults = UserDefaults.standard

        defaults.set(tipPercentages, forKey: "tipPercentages")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipPercentages = defaults.object(forKey: "tipPercentages") as? [Double] ?? []
        tipControl.setTitle(String(format: "%.2f%%", tipPercentages[0] * 100), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.2f%%", tipPercentages[1] * 100), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.2f%%", tipPercentages[2] * 100), forSegmentAt: 2)
        
        calculateTip(0)

        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let bill = Double(billAmountTextField.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "billAmount")
        defaults.synchronize()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let defaults = UserDefaults.standard
        //get total tip by multiplying tip * tip percentage
        let tipPercentages = defaults.object(forKey: "tipPercentages") as? [Double] ?? []
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}
