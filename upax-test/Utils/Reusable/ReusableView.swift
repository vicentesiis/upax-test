//
//  ReusableView.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

public protocol ReusableView: AnyObject {
  static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
