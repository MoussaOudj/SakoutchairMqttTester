//
//  HomeViewController.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var getPayloadButton: UIButton!
    
    @IBOutlet weak var getSonarsButton: UIButton!
    
    @IBOutlet weak var publishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        MqttRequester.prepareRequester()
       
        guard let mqttClient = MqttRequester.mqttClient else {
            return
        }
       
        mqttClient.subscribe("sakoutcher/test/payload", qos: 0)
        mqttClient.subscribe("sakoutcher/test/sonar1", qos: 0)
        mqttClient.subscribe("sakoutcher/test/sonar2", qos: 0)
        mqttClient.subscribe("sakoutcher/test/sonar3", qos: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    @IBAction func navigateToPayloadView(_ sender: UIButton) {
        self.navigationController?.pushViewController(GetPayloadViewController(), animated: true)
    }
    
    
    @IBAction func navigateToSonarsView(_ sender: UIButton) {
        self.navigationController?.pushViewController(GetSonarsViewController(), animated: true)
    }
    
    @IBAction func navigateToPublishView(_ sender: UIButton) {
        self.navigationController?.pushViewController(PublishTopicViewController(), animated: true)
    }
    
}
