//
//  ViewController.swift
//  TrafficLight
//
//  Created by Алишер Маликов on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    @IBOutlet var orangeLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOff
        orangeLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        startButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        let radius = redLight.frame.width / 2
        
        redLight.layer.cornerRadius = radius
        orangeLight.layer.cornerRadius = radius
        greenLight.layer.cornerRadius = radius
    }
    
    @IBAction func startButtonTapped() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLight.alpha =  lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            orangeLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            orangeLight.alpha = lightIsOff
            currentLight = .off
        case .off:
            currentLight = .red
            redLight.alpha = lightIsOff
            orangeLight.alpha = lightIsOff
            greenLight.alpha = lightIsOff
            startButton.setTitle("Start", for: .normal)
        }
    }
    
}

// MARK: - Current Light

extension ViewController {
    enum CurrentLight {
        case red, yellow, green, off
    }
}
