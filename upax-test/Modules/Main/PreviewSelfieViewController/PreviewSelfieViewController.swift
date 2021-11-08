//
//  PreviewSelfieViewController.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

class PreviewSelfieViewController: UIViewController, Storyboarded {
  
  @IBOutlet weak var previewImageView: UIImageView!
  var previewSelfieImage: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.previewImageView.image = previewSelfieImage
  }
  
  func setupView(previewSelfieImage: UIImage) {
    self.previewSelfieImage = previewSelfieImage
  }

}
