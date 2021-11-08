//
//  ChartTableViewCell.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import UIKit
import Charts

class ChartTableViewCell: ReusableTableView {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var chartTitleLabel: UILabel!
  @IBOutlet weak var pieChartView: PieChartView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  func setupView(chartTitle: String, pieChartData: PieChartData) {
    chartTitleLabel.text = chartTitle
    pieChartView.data = pieChartData
  }
  
  private func setup() {
    
    pieChartView.holeColor = UIColor(hex: "#EDF3FB")
    pieChartView.holeRadiusPercent = 0.9
    
    let legend = pieChartView.legend
    legend.formSize = 14
    legend.form = .circle
    legend.font = UIFont.systemFont(ofSize: 14)
    legend.horizontalAlignment = .left
    legend.verticalAlignment = .bottom
    legend.orientation = .horizontal
    legend.xEntrySpace = 40
    legend.yEntrySpace = 10
    
  }
    
}
