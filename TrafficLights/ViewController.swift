//
//  ViewController.swift
//  TrafficLights
//
//  Created by Андрей Евдокимов on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let outletCollection = [redLightView, yellowLightView, greenLightView]
        
        startButton.layer.cornerRadius = 12

        for light in outletCollection {
            if let light = light {
                light.layer.cornerRadius = light.frame.size.height
                light.alpha = 0.3
            }
        }
    }


    @IBAction func startChangeLightButtonPressed() {
        let outletCollection = [redLightView, yellowLightView, greenLightView]

        if (startButton.titleLabel?.text == "START") {
            startButton.setTitle("NEXT", for: .normal)
            outletCollection.first??.alpha = 1
        } else {
            for (index, light) in outletCollection.enumerated() {
                if light?.alpha == 1 {
                    let nextIndex = outletCollection.indices.contains(index + 1) ? index + 1 : 0
                    
                    light?.alpha = 0.3
                    outletCollection[nextIndex]?.alpha = 1
                    
                    break
                }
            }
        }
    }
}

