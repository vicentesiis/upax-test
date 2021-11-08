//
//  NameTableViewCell.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

class NameTableViewCell: ReusableTableView {

  @IBOutlet weak var nameTextField: UITextField!
  
  var mainViewModel: MainViewModel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    nameTextField.delegate = self
  }
  
  func setupView(mainViewModel: MainViewModel) {
    self.mainViewModel = mainViewModel
  }
    
}

// MARK: - UITextViewDelegate
extension NameTableViewCell: UITextFieldDelegate {
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    mainViewModel.userName = textField.text
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    endEditing(true)
    return false
  }
  
}
