//
//  RegisterViewController.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Properties
    private let registerView: RegisterView
    
    // MARK: - Components
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = registerView
    }
    
    init() {
        self.registerView = RegisterView()
        super.init(nibName: nil, bundle: nil)
        self.registerView.delegate = self
        self.registerView.imagePicker.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
}

extension RegisterViewController: RegisterViewDelegate {
    func showImagePicker() {
        present(self.registerView.imagePicker, animated: true, completion: nil)
    }
    
    func backToLogIn() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.registerView.plusPhotoButton.layer.cornerRadius = 128 / 2
        self.registerView.plusPhotoButton.layer.masksToBounds = true
        self.registerView.plusPhotoButton.imageView?.clipsToBounds = true
        self.registerView.plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        self.registerView.plusPhotoButton.layer.borderWidth = 3
        self.registerView.plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        self.registerView.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
}
