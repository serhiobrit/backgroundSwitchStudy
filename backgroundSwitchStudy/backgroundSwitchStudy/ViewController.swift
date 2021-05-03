//
//  ViewController.swift
//  backgroundSwitchStudy
//
//  Created by Serhio Brit on 03.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var switchOption: UISwitch!

    let userData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorName = userData.string(forKey: "backgroundColor")
        let imageName = userData.string(forKey: "image")
        let switcher = userData.string(forKey: "switchOption")
        
        if colorName == "dark" {
            self.view.backgroundColor = .darkGray
        } else {
            self.view.backgroundColor = .systemBackground
        }
        
        if imageName == "firstImage" {
            image.image = UIImage (named: "firstImage")
        } else {
            image.image = UIImage (named: "secondImage")
        }
        
        if switcher == "on" {
            switchOption.isOn = true
        } else {
            switchOption.isOn = false
        }
        
    }
    
    
    
    @IBAction func switchImage(_ sender: UISwitch) {
        
        if sender.isOn {
            self.view.backgroundColor = .darkGray
            image.image = UIImage (named: "firstImage")
            
            userData.setValue("dark", forKey: "backgroundColor")
            userData.setValue("firstImage", forKey: "image")
            userData.setValue("on", forKey: "switchOption")
            
        } else {
            self.view.backgroundColor = .systemBackground
            image.image = UIImage (named: "secondImage")
            
            userData.setValue("light", forKey: "backgroundColor")
            userData.setValue("secondImage", forKey: "image")
            userData.setValue("off", forKey: "switchOption")
            
        }
    }
    
}

