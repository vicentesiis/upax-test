//
//  Utils.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

// MARK: - typealias

typealias ReusableTableView = UITableViewCell & ReusableView & NibLoadableView

// MARK: - protocols

protocol CoordinatorProtocol: AnyObject {
  var parentController: UIViewController! { get set }
  func start()
}

protocol GeneralViewProtocols: AnyObject {
  var showSpinner: Dynamic<Bool> { get }
  var showAlert: Dynamic<String> { get }
}

// MARK: - Class

class Alerts {
  
  typealias AlertIndexCompletion = (Int) -> Void
  
  static func showActionsheet(viewController: UIViewController, title: String?, message: String?, actions: [(String, UIAlertAction.Style)], completion: AlertIndexCompletion?) {
    let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    for (index, (title, style)) in actions.enumerated() {
      let alertAction = UIAlertAction(title: title, style: style) { (_) in
        completion?(index)
      }
      alertViewController.addAction(alertAction)
    }
    
    alertViewController.popoverPresentationController?.sourceView = viewController.view
     
    viewController.present(alertViewController, animated: true, completion: nil)
  }
  
  static func showAlert(viewController: UIViewController, withTitle title: String?, message : String?, actions: [(String, UIAlertAction.Style)], completion: AlertIndexCompletion?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    for (index, (title, style)) in actions.enumerated() {
      let alertAction = UIAlertAction(title: title, style: style) { (_) in
        completion?(index)
      }
      alertController.addAction(alertAction)
    }
    viewController.present(alertController, animated: true, completion: nil)
  }
  
}
