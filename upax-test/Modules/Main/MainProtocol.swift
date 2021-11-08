//
//  MainProtocol.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import UIKit

protocol MainProtocol: GeneralViewProtocols {
  
  var firestoreHandler: FirestoreHandler! { get }
  
  var chartDescription: String { get }
  var selfieImage: UIImage? { get set }
  var userName: String? { get set }
  
}
