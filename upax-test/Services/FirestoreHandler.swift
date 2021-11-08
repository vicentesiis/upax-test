//
//  FirestoreHandler.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import FirebaseFirestore
import UIKit

typealias StateUpload = (Bool) -> ()

enum Collections: String {
  case userData = "user_data"
}

protocol UserFirestoreProtocol {
  func saveData(name: String, selfieImage: UIImage, closure: @escaping StateUpload)
}

class FirestoreHandler: UserFirestoreProtocol {
  
  let firebaseImageStorageHandler: FirebaseImageStorageHandler!
  private var firestoreDataBase = Firestore.firestore()
  
  init(firebaseImageStorageHandler: FirebaseImageStorageHandler) {
    self.firebaseImageStorageHandler = firebaseImageStorageHandler
  }

  func saveData(name: String, selfieImage: UIImage, closure: @escaping StateUpload) {
    firebaseImageStorageHandler.uploadImage(selfieImage) { [weak self] imageRoute in
      guard let self = self, let imageRoute = imageRoute else {
        closure(false)
        return
      }
      let user = User(name: name, imageRoute: imageRoute)
      let userCollection = self.firestoreDataBase.collection(Collections.userData.rawValue)
      do {
        try userCollection.addDocument(data: user.toDictionary())
        closure(true)
      } catch {
        closure(false)
      }
    }
  }
  
}
