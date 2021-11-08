//
//  MainViewModel.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import UIKit


class MainViewModel: MainProtocol {
  
  var showSpinner: Dynamic<Bool>
  var showAlert: Dynamic<String>
  
  var firestoreHandler: FirestoreHandler!
  
  let chartDescription: String = .chartDescription
  
  var userName: String?
  var selfieImage: UIImage?
  
  init() {
    showSpinner = Dynamic(false)
    showAlert = Dynamic("")
    let firebaseImageStorageHandler = FirebaseImageStorageHandler()
    firestoreHandler = FirestoreHandler(firebaseImageStorageHandler: firebaseImageStorageHandler)
  }
  
  func saveUserData() {
    guard userCanSaveData() else {
      showAlert.value = .needCompleteData
      return
    }
    showSpinner.value = true
    guard let userName = userName, let selfieImage = selfieImage else {
      return
    }

    firestoreHandler.saveData(name: userName, selfieImage: selfieImage) { [weak self] state in
      guard let self = self else { return }
      self.showSpinner.value = false
      if state {
        self.showAlert.value = .dataSaved
      } else {
        self.showAlert.value = .genericError
      }
      
    }
  }
  
  private func userCanSaveData() -> Bool {
    return userName != nil && selfieImage != nil
  }
  
  func hideSpinner() {
    showSpinner.value = false
  }
  
}
