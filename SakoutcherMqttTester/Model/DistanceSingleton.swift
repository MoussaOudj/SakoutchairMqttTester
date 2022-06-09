//
//  DistanceSingleton.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 08/06/2022.
//

import Foundation

public class DistanceSingleton {
    public static let sharedInstance = DistanceSingleton()
    var distance:String = ""
    private init() {
    }
}
