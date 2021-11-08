//
//  DescriptionChartTableViewCell.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

class DescriptionChartTableViewCell: ReusableTableView {

  @IBOutlet weak var descriptionLabel: UILabel!
  
  var mainViewModel: MainViewModel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupCell(mainViewModel: MainViewModel) {
    descriptionLabel.text = mainViewModel.chartDescription
  }
    
}
