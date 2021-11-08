//
//  Question.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import Foundation

struct Question: Decodable {
  
  var colors: [String]
  var questions: [Questions]
  
}

struct Questions: Decodable {
  
  var total: Int
  var text: String
  var chartData: [ChartData]
  
}

struct ChartData: Decodable {
  
  var text: String
  var percetnage: Int
  
}
