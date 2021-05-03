//
//  ViewController.swift
//  backgroundSwitchStudy
//
//  Created by Serhio Brit on 03.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    let userData = UserDefaults.standard
    
    enum Colors: String {
        case light
        case dark
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var color: UIColor? {
            guard let name = UserDefaults.standard.object(forKey: "backgroundColor") as? String,
                let color = Colors(rawValue: name) else { return nil }
            switch color {
            case .light: return .systemBackground
            case .dark: return .darkGray
            }
        }
                
        if color == nil {
            self.view.backgroundColor = .systemBackground
        } else {
            self.view.backgroundColor = color
        }
        
    }
    
    
    
    @IBAction func switchImage(_ sender: UISwitch) {
        
        if sender.isOn {
            self.view.backgroundColor = .darkGray
            image.image = UIImage (named: "firstImage")
            
            userData.setValue(".dark", forKey: "backgroundColor")
            
//            userData.setValue(UIColor.darkGray, forKey: "backgroundColor")
//            userData.setValue("firstImage", forKey: "image")
            
        } else {
            self.view.backgroundColor = .systemBackground
            image.image = UIImage (named: "secondImage")
            
//            userData.setValue(UIColor.systemBackground, forKey: "backgroundColor")
//            userData.setValue("secondImage", forKey: "image")
            
        }
        
    }
    
}

