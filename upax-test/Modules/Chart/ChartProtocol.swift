//
//  ChartProtocol.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import Charts

protocol ChartViewModelProtocol: GeneralViewProtocols {
  var chartsData: Dynamic<[PieChartData]?> { get }
}

protocol ChartRepositoryProtocol: AnyObject {
  func fetchDataChart(completion: @escaping QuestionResponse)
}
