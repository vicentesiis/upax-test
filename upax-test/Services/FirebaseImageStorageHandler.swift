//
//  FirebaseImageStorageHandler.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import UIKit
import FirebaseStorage

typealias ImageNameClosure = (String?) -> ()

protocol FirebaseImageStorageProtocol: AnyObject {
  func uploadImage(_ image: UIImage, closure: @escaping ImageNameClosure)
}

class FirebaseImageStorageHandler: FirebaseImageStorageProtocol {
  
  init() { }
  
  func uploadImage(_ image: UIImage, closure: @escaping ImageNameClosure) {
    
    let storage = Storage.storage().reference()
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    
    let metaData = StorageMetadata()
    metaData.contentType = .contentType
    
    let uuid = UUID().uuidString
    
    storage.child(.imageRoute + uuid).putData(imageData, metadata: metaData) { storageMetadata, error in
      guard storageMetadata != nil else {
        closure(nil)
        print("oops an error occured while data uploading")
        return
      }
      closure(storageMetadata?.name)
      print("Image sent")
    }
    
  }
  
}
