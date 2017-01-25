//
//  ViewController.swift
//  Acoounts_For_ING
//
//  Created by sabina on 19/01/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import UIKit


class DonutViewController: UIViewController {

    var accounts = [Account]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     loadPieChart()

        
    }
    
    func loadPieChart() {
        
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = PNPieChartDataItem(dateValue:985000, dateColor:  PNRed, description: self.accounts[0].accountName!)
        let item2 = PNPieChartDataItem(dateValue:1000000, dateColor: PNYellow, description:",")
        let item3 = PNPieChartDataItem(dateValue:15000, dateColor: PNBlue, description: "")
        
        
        let frame = CGRect(x: 40.0, y: 155.0, width: 240.0, height: 240.0)
        let items: [PNPieChartDataItem] = [item1, item2, item3]
        let pieChart = PNPieChart(frame: frame, items: items)
        pieChart.descriptionTextColor = UIColor.white
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 14.0)!
        pieChart.center = self.view.center
        
        // Change the chart you want to present here
        self.view.addSubview(pieChart)
        
    }


}

