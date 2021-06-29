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
        let mqttConfig = MQTTConfig(clientId: "99ab8a569d244195954e17b8d842c8d6", host: "test.mosquitto.org", port: 1883, keepAlive: 60)
        
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
            print("MQTT Message received: payload=\(msg)")
        }
        
        // create new MQTT Connection
        self.mqttClient = MQTT.newConnection(mqttConfig)
    }
    
}
