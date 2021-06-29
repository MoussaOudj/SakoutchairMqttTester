//
//  GetSonarsViewController.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

import UIKit
import Charts

class GetSonarsViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var numbers : [Int] = TestDataCapteurs.capteursData?.capteurs.sonar ?? [1,2,3]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        
        
        for i in 0 ..< numbers.count {
            let value = ChartDataEntry(x: Double(i), y: Double(numbers[i])) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }

               let line1 = LineChartDataSet(entries: lineChartEntry, label: "Distance")
               line1.colors = [NSUIColor.blue] //Sets the colour to blue

               let data = LineChartData()
               data.addDataSet(line1)
               

        lineChartView.data = data
        lineChartView.chartDescription?.text = "Current sonnar value"
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
