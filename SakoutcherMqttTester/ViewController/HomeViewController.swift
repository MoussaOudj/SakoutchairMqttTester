//
//  HomeViewController.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW DID LOAD")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        MqttRequester.prepareRequester()
       
        guard let mqttClient = MqttRequester.mqttClient else {
            return
        }
        
        print(mqttClient.isConnected)
        mqttClient.subscribe("sonar/distance", qos: 0)
        
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(getDisance), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func getDisance() {
        let distanceSingleton = DistanceSingleton.sharedInstance
        self.distanceLabel.text = distanceSingleton.distance + " cm"
    }
}
