//
//  ChartCoordinator.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

class ChartCoordinator: CoordinatorProtocol {
  
  weak var parentController: UIViewController!
  
  init(parentController: UIViewController) {
    self.parentController = parentController
  }
  
  func start() {
    let chartRepository = ChartRepository()
    let chartViewModel = ChartViewModel(repository: chartRepository)
    let chartViewController = ChartViewController.instantiate(fromStoryboard: "ChartViewController")
    chartViewController.setupView(viewModel: chartViewModel)
    parentController.show(chartViewController, sender: nil)
  }
  
}
