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
    
    var numbers : [Double] = [2,4,6,8,10]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        for i in 0 ..< numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }

               let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
               line1.colors = [NSUIColor.blue] //Sets the colour to blue

               let data = LineChartData() //This is the object that will be added to the chart
               data.addDataSet(line1) //Adds the line to the dataSet
               

        lineChartView.data = data //finally - it adds the chart data to the chart and causes an update
        lineChartView.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
