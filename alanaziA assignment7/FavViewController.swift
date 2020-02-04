//
//  FavViewController.swift
//  alanaziA assignment7
//
//  Created by abdulrahman alanazi on 3/5/19.
//  Copyright © 2019 abdulrahman alanazi. All rights reserved.
//

import UIKit

class FavViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channalTextField: UITextField!
    @IBOutlet weak var favSeg: UISegmentedControl!
    
    var favLocal:[Int:[Int:String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func channelStepper(_ sender: UIStepper) {
        var min = 1
        min = Int(sender.value)
        channelLabel.text = "\(min)"
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        done(self.channalTextField)
        if let n = favLocal[favSeg.selectedSegmentIndex] {
            favGlobal[favSeg.selectedSegmentIndex] = n
        }
        showMsg("Saved", "setting for favorite button #\(favSeg.selectedSegmentIndex+1) has been saved into TV config.")
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        done(self.channalTextField)
        showMsg("ignored", "setting for favorite buttons has NOT been saved. it is available for this VC only.")
    }
    
    @IBAction func favSegSelected(_ sender: UISegmentedControl) {
        channelLabel.text = "\(favLocal[sender.selectedSegmentIndex]?.keys.first ?? 1)"
        stepper.value = Double(favLocal[sender.selectedSegmentIndex]?.keys.first ?? 1)
        channalTextField.text = favLocal[sender.selectedSegmentIndex]?.values.first ?? ""
    }
    

    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
        let name = self.channalTextField.text!
        if(name.count == 0){
            showMsg("Empty Label", "Sorry, I cannot use this label.\nLabel length must be between 1-4")
            self.channalTextField.text = ""
        } else if (name.count > 4) {
            showMsg("Long Label", "Label length must be between 1-4")
            self.channalTextField.text = ""
        } else{
            favLocal[favSeg.selectedSegmentIndex] = [ Int(stepper.value) : name ]
        }
    }
    
    func showMsg(_ title: String, _ msg: String){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}
