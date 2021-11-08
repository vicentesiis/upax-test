//
//  ChartRepository.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import Alamofire

class ChartRepository: ChartRepositoryProtocol {
  
  func fetchDataChart(completion: @escaping QuestionResponse) {
    RestAPI.getQuestions { response in
      switch response {
        case .success(let question):
          completion(.success(question))
        case .failure(let error):
          completion(.failure(error))
      }
    }
  }
  
  
}
