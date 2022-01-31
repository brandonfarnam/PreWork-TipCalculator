//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Nguyen, Khang on 1/23/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var tip1Label: UITextField!
    @IBOutlet weak var tip2Label: UITextField!
    @IBOutlet weak var tip3Label: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        let defaults = UserDefaults.standard
        let tipPercentages = defaults.object(forKey: "tipPercentages") as? [Double] ?? []
        
        tip1Label.text = String(format: "%.2f", tipPercentages[0])
        tip2Label.text = String(format: "%.2f", tipPercentages[1])
        tip3Label.text = String(format: "%.2f", tipPercentages[2])
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipPercentages = defaults.object(forKey: "tipPercentages") as? [Double] ?? []
        
        tip1Label.text = String(format: "%.2f", tipPercentages[0])
        tip2Label.text = String(format: "%.2f", tipPercentages[1])
        tip3Label.text = String(format: "%.2f", tipPercentages[2])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        submit(0)
    }
    
    @IBAction func submit(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tip1 = Double(tip1Label.text!) ?? 0.0
        let tip2 = Double(tip2Label.text!) ?? 0.0
        let tip3 = Double(tip3Label.text!) ?? 0.0
        let newTipSettings = [tip1, tip2, tip3]
        print("aaaaa")
        print(newTipSettings)
        defaults.set(newTipSettings, forKey: "tipPercentages")
        ViewController.sharedInstance.tipPercentages = defaults.object(forKey: "tipPercentages") as? [Double] ?? []
        
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
