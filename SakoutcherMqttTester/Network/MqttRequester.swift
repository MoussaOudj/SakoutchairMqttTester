//
//  MqttRequester.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

import Foundation
import Moscapsule


public class MqttRequester {
    
    static var mqttClient:MQTTClient?
    
    public static func prepareRequester() {
        // set MQTT Client Configuration
        let mqttConfig = MQTTConfig(clientId: "8e76435fd1e94d5182e85d36900c506b", host: "cindy.local", port: 1883, keepAlive: 3600)
        
        mqttConfig.onConnectCallback = { returnCode in
            print("CONNECTED : \(returnCode.description)")
        }
        
        mqttConfig.onDisconnectCallback = { returnCode in
                print("DISCCONECTED : \(returnCode)")
        }
        
        mqttConfig.onMessageCallback = { mqttMessage in
           
            guard let msg = mqttMessage.payloadString else {
                return
            }
            
            if mqttMessage.topic == "sonar/distance" {
                let distanceSingleton = DistanceSingleton.sharedInstance
                distanceSingleton.distance = msg
                print("Message reçu = \(msg)")
            }
        }
        
        mqttConfig.onSubscribeCallback = { (messageId, grantedQos) in
          print("subscribed (mid=\(messageId),grantedQos=\(grantedQos))")
        }
        
        // create new MQTT Connection
        self.mqttClient = MQTT.newConnection(mqttConfig)
    }
    
}
