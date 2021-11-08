//
//  ChartViewModel.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import Charts

class ChartViewModel: ChartViewModelProtocol {
  
  var chartsData: Dynamic<[PieChartData]?>
  var showSpinner: Dynamic<Bool>
  var showAlert: Dynamic<String>
  
  private let repository: ChartRepositoryProtocol
  
  var question: Question?
  
  init(repository: ChartRepository) {
    self.repository = repository
    chartsData = Dynamic(nil)
    showSpinner = Dynamic(false)
    showAlert = Dynamic("")
  }
  
  func fetchData() {
    showSpinner.value = true
    repository.fetchDataChart { [weak self] response in
      switch response {
        case .success(let question):
          self?.question = question
          self?.getChartData()
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
  
  private func getDataEntry() -> [[PieChartDataEntry]]? {
    
    let questions = question?.questions
    guard let questions = questions else { return nil }

    let entries = questions.map { question -> [PieChartDataEntry] in
      question.chartData.map({ chartData -> PieChartDataEntry in
        return PieChartDataEntry(value: Double(chartData.percetnage), label: chartData.text + " \(chartData.percetnage)%")
      })
    }
    return entries
  }
  
  func getChartData() {
    guard let dataEntry = getDataEntry() else { return }
    let sets = dataEntry.map({ entries -> PieChartDataSet in
      return PieChartDataSet(entries: entries)
    })
    let chartData = sets.map { singleSet -> PieChartData in
      singleSet.label = nil
      singleSet.colors = [.systemGreen, .systemRed, .systemBlue, .systemGray, .systemPink, .systemMint]
      singleSet.drawValuesEnabled = false
      let data = PieChartData(dataSet: singleSet)
      data.setValueTextColor(.clear)
      return data
    }
    showSpinner.value = false
    chartsData.value = chartData
  }
  
}
