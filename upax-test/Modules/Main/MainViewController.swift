//
//  MainViewController.swift
//  upax-test
//
//  Created by Andres Cantu on 06/11/21.
//

import UIKit

fileprivate enum Rows: Int {
  case name, selfie, chart
}

class MainViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  // This will be injected by coordinator
  let viewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupBinds()
  }
  
  private func setupTableView() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(NameTableViewCell.self)
    tableView.register(SelfieTableViewCell.self)
    tableView.register(DescriptionChartTableViewCell.self)
  }
  
  func setupBinds() {
    
    viewModel.showSpinner.bind { [weak self] showSpinner in
      guard let self = self else { return }
      if showSpinner {
        self.showSpinner(onView: self.view)
      } else {
        self.removeSpinner()
      }
    }
    
    viewModel.showAlert.bind { [weak self] title in
      guard let self = self else { return }
      Alerts.generalAlertController(viewController: self, title: title, message: nil, nil)
    }
    
  }
  
  private func showOptionsSelfie() {
    Alerts.selfieOptionsActionSheed(viewController: self) { [weak self] optionChoosed in
      guard let self = self else { return }
      switch optionChoosed {
        case .preview:
          if let selfieImage = self.viewModel.selfieImage {
            let previewSelfieCoordinator = PreviewSelfieCoordinator.init(parentController: self, previewSelfieImage: selfieImage)
            previewSelfieCoordinator.start()
          } else {
            Alerts.generalAlertController(viewController: self, title: "Necesita tomar una selfie primero", message: nil, nil)
          }
        case .takePhoto: self.showCamera()
        case .cancel: break
      }
    }
  }
  
  @IBAction func saveButtonDidPressed(_ sender: Any) {
    viewModel.saveUserData()
  }
  
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == Rows.selfie.rawValue {
      showOptionsSelfie()
    } else if indexPath.row == Rows.chart.rawValue {
      let chartCoordinator = ChartCoordinator.init(parentController: self)
      chartCoordinator.start()
    }
  }
  
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == Rows.name.rawValue {
      let nameCell = tableView.dequeueReusableCell(for: indexPath) as NameTableViewCell
      nameCell.setupView(mainViewModel: viewModel)
      return nameCell
    } else if indexPath.row == Rows.selfie.rawValue {
      let selfieCell = tableView.dequeueReusableCell(for: indexPath) as SelfieTableViewCell
      return selfieCell
    } else {
      let descriptionCell = tableView.dequeueReusableCell(for: indexPath) as DescriptionChartTableViewCell
      descriptionCell.setupCell(mainViewModel: viewModel)
      return descriptionCell
    }
    
  }
  
}

// MARK: - UINavigationControllerDelegate & UIImagePickerControllerDelegate
extension MainViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  func showCamera() {
    let vc = UIImagePickerController()
    vc.sourceType = .camera
    vc.allowsEditing = true
    vc.cameraDevice = .front
    vc.delegate = self
    present(vc, animated: true)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true)
    guard let image = info[.editedImage] as? UIImage else {
      print("No image found")
      return
    }
    viewModel.selfieImage = image
  }
  
}
