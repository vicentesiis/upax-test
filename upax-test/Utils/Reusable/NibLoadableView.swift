//
//  NibLoadableView.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

public protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
  static var nibName: String{
    return String(describing: self)
  }
}

public extension NibLoadableView where Self: UIView {
  
  var nibName: String {
    return String(describing: type(of: self))
  }

  var bundle: Bundle {
    return Bundle(for: type(of: self))
  }
  
  func loadNib() {
    guard let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
      return
    }
    addSubview(view)
    constraints(to: view)
  }
  
}
