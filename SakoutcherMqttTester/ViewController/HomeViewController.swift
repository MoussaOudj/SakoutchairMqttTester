//
//  HomeViewController.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    @IBOutlet weak var fanAnimationView: AnimationView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        MqttRequester.prepareRequester()
        guard let mqttClient = MqttRequester.mqttClient else {
            return
        }
        
        print(mqttClient.isConnected)
        mqttClient.subscribe("sonar/distance", qos: 0)
        
        DispatchQueue.main.async {
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.getDistance), userInfo: nil, repeats: true)
        }
        self.configureComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func getDistance() {
        let distanceSingleton = DistanceSingleton.sharedInstance
        if distanceSingleton.distance != "" {
            self.distanceLabel.text = "Distance : " + distanceSingleton.distance + " cm"
            if Float(distanceSingleton.distance)! < 200 {
                self.fanAnimationView.animationSpeed = 0.2
                self.speedLabel.text = "Slow"
                self.infoLabel.text = "Vitesse lente"
                self.fanAnimationView.play()
            } else {
                self.fanAnimationView.animationSpeed = 1.8
                self.speedLabel.text = "Normal"
                self.infoLabel.text = "Vitesse normal"
                self.fanAnimationView.play()
            }
        } else {
            self.distanceLabel.text = "Distance : No data received"
        }
    }
    
    func configureComponents() {
        self.cardView.layer.cornerRadius = 25
        self.cardView.backgroundColor = UIColor(red: 0.00, green: 0.78, blue: 0.64, alpha: 1.00)
        self.cardView.layer.shadowColor = UIColor.black.cgColor
        self.cardView.layer.shadowOpacity = 0.2
        self.cardView.layer.shadowOffset = CGSize(width: 3, height: 5)
        self.cardView.layer.shadowRadius = 2
        
        self.fanAnimationView.backgroundColor = .clear
        self.fanAnimationView.loopMode = .loop
        
        self.infoView.layer.cornerRadius = 25
        self.distanceLabel.textColor = UIColor(red: 0.92, green: 0.16, blue: 0.35, alpha: 1.00)
        self.speedLabel.textColor = UIColor(red: 0.92, green: 0.16, blue: 0.35, alpha: 1.00)
    }
}
