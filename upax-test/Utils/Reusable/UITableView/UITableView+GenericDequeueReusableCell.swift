//
//  UITableView+GenericDequeueReusableCell.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

public extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexpath: IndexPath) -> T where T : ReusableView  {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexpath)  as? T else {
            fatalError("Could not dequeue cell with identifier : \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: ReusableView {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            debugPrint("Could not dequeueReusableHeaderFooterView with identifier : \(T.reuseIdentifier)")
            return nil
        }
        return cell
    }

}
