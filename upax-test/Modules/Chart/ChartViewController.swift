//
//  ChartViewController.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController, Storyboarded {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var viewModel: ChartViewModel!
  private var chartsData: [PieChartData]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupBinds()
    viewModel.fetchData()
  }
  
  func setupTableView() {
    tableView.register(ChartTableViewCell.self)
    tableView.rowHeight = UITableView.automaticDimension
  }
  
  func setupView(viewModel: ChartViewModel) {
    title = .chartTitle
    self.viewModel = viewModel
  }
  
  private func setupBinds() {
    
    viewModel.showSpinner.bind { [weak self] showSpinner in
      guard let self = self else { return }
      if showSpinner {
        self.showSpinner(onView: self.view)
      } else {
        self.removeSpinner()
      }
    }
    
    viewModel.chartsData.bind { [weak self] chartsData in
      self?.chartsData = chartsData
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }

}

// MARK: - UITableViewDataSource
extension ChartViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chartsData?.count ?? .zero
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let chartsData = chartsData, let chartTitle = viewModel.question?.questions[indexPath.row].text
    else { return UITableViewCell() }
    let chartCell = tableView.dequeueReusableCell(for: indexPath) as ChartTableViewCell
    chartCell.setupView(chartTitle: chartTitle, pieChartData: chartsData[indexPath.row])
    return chartCell
  }
  
}
