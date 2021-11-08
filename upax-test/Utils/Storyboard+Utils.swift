//
//  Storyboard+Utils.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

public protocol Storyboarded {
  static func instantiate(fromStoryboard nibName: String) -> Self
}

public extension Storyboarded where Self: UIViewController {
  static func instantiate(fromStoryboard nibName: String) -> Self {
      let id = String(describing: self)
      let storyboard = UIStoryboard(name: nibName, bundle: Bundle(for: Self.self))
    return storyboard.instantiateViewController(withIdentifier: id) as! Self
  }
}
