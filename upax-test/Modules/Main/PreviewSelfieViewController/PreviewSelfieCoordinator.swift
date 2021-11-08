//
//  PreviewSelfieCoordinator.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

class PreviewSelfieCoordinator: CoordinatorProtocol {
  
  weak var parentController: UIViewController!
  private let previewSelfieImage: UIImage
  
  init(parentController: UIViewController, previewSelfieImage: UIImage) {
    self.parentController = parentController
    self.previewSelfieImage = previewSelfieImage
  }
  
  func start() {
    
    let vc = PreviewSelfieViewController.instantiate(fromStoryboard: "PreviewSelfieViewController")
    vc.setupView(previewSelfieImage: previewSelfieImage)
    
    let nav = UINavigationController(rootViewController: vc)
    nav.modalPresentationStyle = .pageSheet
    if let sheet =  nav.sheetPresentationController {
      sheet.detents = [.medium()]
    }
    
    parentController.present(nav, animated: true, completion: nil)
    
  }
  
}
