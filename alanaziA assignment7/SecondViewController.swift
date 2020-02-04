//
//  SecondViewController.swift
//  alanaziA assignment7
//
//  Created by abdulrahman alanazi on 3/5/19.
//  Copyright © 2019 abdulrahman alanazi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    
    @IBOutlet var btns: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        self.powerLabel.text = (sender.isOn) ? "On":"Off"
        self.powerLabel.textColor = (sender.isOn) ? UIColor.green : UIColor.red
        for btn in btns {
            btn.isEnabled = sender.isOn
        }
        self.stateLabel.text = "Stopped"
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func playBtn(_ sender: UIButton) {
        let current:String = self.stateLabel.text!
        
        if((current != "Recording")){
            self.stateLabel.text = "Playing"
        }
        else {
            let alertController = UIAlertController(title: "need choise", message: "force Playing", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "cancel", style: .cancel , handler: nil)
            let action2 = UIAlertAction(title: "confirm", style: .default , handler:  {(alert: UIAlertAction!) in
                self.stateLabel.text = "Playing"
                
            })
            alertController.addAction(action2)
            alertController.addAction(action1)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func pauseBtn(_ sender: UIButton) {
        let current:String = self.stateLabel.text!
        if(current=="Playing"){
            self.stateLabel.text = "Pause"
        }
        else {
            let alertController = UIAlertController(title: "need choise", message: "force Pause", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "cancel", style: .cancel , handler: nil)
            let action2 = UIAlertAction(title: "confirm", style: .default , handler:  {(alert: UIAlertAction!) in
                self.stateLabel.text = "Pause"
                
                _ = UIAlertAction(title: "done", style: .default , handler: nil)
                
                
            })
            alertController.addAction(action2)
            alertController.addAction(action1)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        self.stateLabel.text = "Stopped"
    }
    
    @IBAction func forwardBtn(_ sender: UIButton) {
        let current:String = self.stateLabel.text!
        if(current=="Playing"){
            self.stateLabel.text = "Forwarding"
        }
        else {
            let alertController = UIAlertController(title: "need choise", message: "force Forwarding", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "cancel", style: .cancel , handler: nil)
            let action2 = UIAlertAction(title: "confirm", style: .default , handler:  {(alert: UIAlertAction!) in
                self.stateLabel.text = "Forwarding"
                
            })
            alertController.addAction(action2)
            alertController.addAction(action1)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func backwardBtn(_ sender: UIButton) {
        let current:String = self.stateLabel.text!
        if(current=="Playing"){
            self.stateLabel.text = "Rewinding"
        }
        else {
            let alertController = UIAlertController(title: "need choise", message: "force Rewinding", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "cancel", style: .cancel , handler: nil)
            let action2 = UIAlertAction(title: "confirm", style: .default , handler:  {(alert: UIAlertAction!) in
                self.stateLabel.text = "Rewinding"
                
            })
            alertController.addAction(action2)
            alertController.addAction(action1)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func recordBtn(_ sender: UIButton) {
        let current:String = self.stateLabel.text!
        if((current=="Stopped")){
            self.stateLabel.text = "Recording"
        }
        else {
            let alertController = UIAlertController(title: "need choise", message: "force Recording", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "cancel", style: .cancel , handler: nil)
            let action2 = UIAlertAction(title: "confirm", style: .default , handler:  {(alert: UIAlertAction!) in
                self.stateLabel.text = "Recording"
                
            })
            alertController.addAction(action2)
            alertController.addAction(action1)
            present(alertController, animated: true, completion: nil)
            
        }
        
        
    }
}

