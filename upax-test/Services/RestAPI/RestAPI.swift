//
//  RestAPI.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import Foundation
import Alamofire

fileprivate let baseURL = "https://us-central1-bibliotecadecontenido.cloudfunctions.net"

typealias QuestionResponse = (Result<Question, Error>) -> ()

class RestAPI {
    
  class func getQuestions(completion: @escaping QuestionResponse) {
        
    let uri = baseURL + "/helloWorld"
        
    AF.request(uri.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!, method: .get)
      .responseDecodable { (response: DataResponse<Question, AFError>) in
                
        let jsonDecoder = JSONDecoder()
                
        do {
          let mappedResponse = try jsonDecoder.decode(Question.self, from: response.data!)
          completion(.success(mappedResponse))
        } catch (let error) {
          completion(.failure(error))
        }

      }
        
  }
       
}
