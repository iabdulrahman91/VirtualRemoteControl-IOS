//
//  FirstViewController.swift
//  alanaziA assignment7
//
//  Created by abdulrahman alanazi on 3/5/19.
//  Copyright © 2019 abdulrahman alanazi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    
    
    @IBOutlet var btns: [UIButton]!
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var favSeg: UISegmentedControl!
    
    var entered:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0...3 {
            favSeg.setTitle(favGlobal[i].values.first!, forSegmentAt: i)
        }
        channelLabel.text = "\(favGlobal[favSeg.selectedSegmentIndex].keys.first ?? 1)"
        
    }
    
    @IBAction func favSegClicked(_ sender: UISegmentedControl) {
        self.channelLabel.text = "\(favGlobal[sender.selectedSegmentIndex].keys.first!)"
    }
    
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        self.powerLabel.text = (sender.isOn) ? "On":"Off"
        self.powerLabel.textColor = (sender.isOn) ? UIColor.green : UIColor.red
        self.volumeSlider.isEnabled = sender.isOn
        self.volumeSlider.isEnabled = sender.isOn
        self.favSeg.isEnabled = sender.isOn
        
        for btn in btns {
            btn.isEnabled = sender.isOn
        }
    }
    
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        self.volumeLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func channelBtn(_ sender: UIButton) {
        let en = Int((sender.titleLabel?.text)!)!
        self.entered+="\(en)"
        if(self.entered.count >= 2){
            
            self.channelLabel.text = (Int(self.entered)! > 0) ? "\(Int(self.entered)!)" : "1"
            self.entered = ""
        }
        
    }
    
    
    @IBAction func incBtn(_ sender: UIButton) {
        let current:Int = Int(self.channelLabel.text!)!
        if ((current+1) <= 99){
            self.channelLabel.text = "\(current+1)"
        }
    }
    
    @IBAction func dcsBtn(_ sender: UIButton) {
        let current:Int = Int(self.channelLabel.text!)!
        if ((current-1) > 0){
            self.channelLabel.text = "\(current-1)"
        }
    }
    
}

