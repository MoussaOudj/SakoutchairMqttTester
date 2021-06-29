//
//  SonarTest.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let capteurJSON = try? newJSONDecoder().decode(CapteurJSON.self, from: jsonData)

import Foundation

// MARK: - CapteurJSON
class CapteurJSON: Codable {
    let capteurs: Capteurs

    init(capteurs: Capteurs) {
        self.capteurs = capteurs
    }
}

// MARK: - Capteurs
class Capteurs: Codable {
    let sonar: [Int]
    let isHere: Bool

    init(sonar: [Int], isHere: Bool) {
        self.sonar = sonar
        self.isHere = isHere
    }
}
