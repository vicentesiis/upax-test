//
//  Extensions.swift
//  upax-test
//
//  Created by Andres Cantu on 07/11/21.
//

import Foundation
import UIKit

// MARK: - UIViewController
var spinner : UIView?
extension UIViewController {
  
  func showSpinner(onView : UIView) {
    let spinnerView = UIView.init(frame: onView.bounds)
    spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    let indicatorView = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
    indicatorView.startAnimating()
    indicatorView.center = spinnerView.center
        
    DispatchQueue.main.async {
      spinnerView.addSubview(indicatorView)
      onView.addSubview(spinnerView)
    }
        
    spinner = spinnerView
  }
    
  func removeSpinner() {
    DispatchQueue.main.async {
      spinner?.removeFromSuperview()
      spinner = nil
    }
  }
  
}

// MARK: - UIView
extension UIView {
  
  func constraints(to childView: UIView, constant: CGFloat = 0.0) {
    DispatchQueue.main.async {
      childView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        childView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: constant),
        childView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -constant),
        childView.topAnchor.constraint(equalTo: self.topAnchor, constant: constant),
        childView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -constant)
      ])
    }
  }
  
}

// MARK: - Alerts
extension Alerts {
  
  typealias SelfieOptionSelectedClosure = (Options) -> ()
  typealias AlertControllerOptionSelected = () -> ()
  
  enum Options {
    case preview
    case takePhoto
    case cancel
  }
  
  static func selfieOptionsActionSheed(viewController: UIViewController, _ closure: @escaping SelfieOptionSelectedClosure) {
    
    var actions: [(String, UIAlertAction.Style)] = []
    actions.append((.visualize, .default))
    actions.append((.takeSelfie, .default))
    actions.append((.cancel, .cancel))
    
    showActionsheet(viewController: viewController, title: nil, message: .chooseAnOption, actions: actions) { index in
      switch index {
        case 0: closure(.preview)
        case 1: closure(.takePhoto)
        default: closure(.cancel)
      }
    }
  }
  
  static func generalAlertController(viewController: UIViewController, title: String?, message: String?, _ closure: AlertControllerOptionSelected? = nil) {
    var actions: [(String, UIAlertAction.Style)] = []
    actions.append(("OK", .default))
    showAlert(viewController: viewController, withTitle: title, message: nil, actions: actions, completion: nil)
  }
  
}

// MARK: - UIColor
extension UIColor {
  public convenience init?(hex: String) {
    let r, g, b, a: CGFloat

    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])

      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255

          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }

    return nil
  }
}

// MARK: - Encodable
extension Encodable {

  func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
    let data = try encoder.encode(self)
    let object = try JSONSerialization.jsonObject(with: data)
    guard let json = object as? [String: Any] else {
      let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
      throw DecodingError.typeMismatch(type(of: object), context)
    }
    return json
  }
}

