//
//  RegisterView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit
import Firebase

protocol RegisterViewDelegate: AnyObject {
    func backToLogIn()
    func showImagePicker()
}

class RegisterView: UIView {
    // MARK: - Properties
    weak var delegate: RegisterViewDelegate?
    public let imagePicker = UIImagePickerController()
    private var regularConstraints: [NSLayoutConstraint] = []
    private var compactConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Components
    let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(addPhotoButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var emailContainerView: UIView = {
        let email = UIImage(named: "ic_mail_outline_white_2x-1")
        let view = Utils().makeView(with: email, textField: emailTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let password = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utils().makeView(with: password, textField: passwordTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var fullnameContainerView: UIView = {
        let fullname = UIImage(named: "ic_person_outline_white_2x")
        let view = Utils().makeView(with: fullname, textField: fullnameTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var usernameContainerView: UIView = {
        let username = UIImage(named: "ic_person_outline_white_2x")
        let view = Utils().makeView(with: username, textField: usernameTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
        
    private let emailTextField: UITextField = {
        let email = Utils().makeTextField(with: "Email", font: .systemFont(ofSize: 16))
        return email
    }()
    
    private let passwordTextField: UITextField = {
        let password = Utils().makeTextField(with: "Password", font: .systemFont(ofSize: 16))
        password.isSecureTextEntry = true
        return password
    }()
    
    private let fullnameTextField: UITextField = {
        let fullname = Utils().makeTextField(with: "Full Name", font: .systemFont(ofSize: 16))
        return fullname
    }()
    
    private let usernameTextField: UITextField = {
        let username = Utils().makeTextField(with: "Username", font: .systemFont(ofSize: 16))
        return username
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(turnOnRegisterButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAnAccount: UIButton = {
        let button = Utils().makeButton(textOne: "Already have an account? ", textTwo: " Log In")
        button.addTarget(self, action: #selector(backToLogIn(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.backgroundColor = .twitterBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.setup()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        NSLayoutConstraint.activate(regularConstraints)
        self.turnOnConstraintsBasedOn(traitCollection)
    }
    
    // MARK: - Selectors
    @objc func backToLogIn(_ sender: UIButton) {
        self.delegate?.backToLogIn()
    }
    
    @objc func addPhotoButton(_ sender: UIButton) {
        self.delegate?.showImagePicker()
    }
    
    @objc func turnOnRegisterButton(_ sender: UIButton) {
        print("register tapped")
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error ==> ❌❌❌ \(error.localizedDescription)")
                return
            }
            print("----->>> 🥳🥳🥳 Success => ✅✅✅ with EMAIL => \(email) and PASSWORD => \(password)")
        }
    }
    
    // MARK: - Methods
    private func turnOnConstraintsBasedOn(_ traitCollection: UITraitCollection) {
        switch traitCollection.verticalSizeClass {
        case .regular:
            NSLayoutConstraint.activate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
        case .compact:
            NSLayoutConstraint.activate(compactConstraints)
            NSLayoutConstraint.deactivate(regularConstraints)
        default: break
        }
    }
}

    // MARK: - Extensions
extension RegisterView: CodeView {
    func buildViewHierarchy() {
        self.imagePicker.allowsEditing = true
        self.addSubview(plusPhotoButton)
        self.addSubview(stack)
        
        self.stack.addArrangedSubview(emailContainerView)
        self.stack.addArrangedSubview(passwordContainerView)
        self.stack.addArrangedSubview(fullnameContainerView)
        self.stack.addArrangedSubview(usernameContainerView)
        self.stack.addArrangedSubview(registerButton)
        
        self.addSubview(alreadyHaveAnAccount)
    }
    
    func setupConstraints() {
        self.plusPhotoButton.turnOnCenterX(toView: self, topAnchor: safeAreaLayoutGuide.topAnchor)
        self.plusPhotoButton.turnOnDimenssion(toWidth: 150, toHeight: 150)
        
        self.stack.turnOnPinTo(top: plusPhotoButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 32,paddingLeft: 38, paddingRight: 38)
        self.alreadyHaveAnAccount.turnOnPinTo(left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingLeft: 40, paddingRight: 40)
        
        self.regularConstraints.append(contentsOf: [
        ])
        
        self.compactConstraints.append(contentsOf: [
        ])
    }
    
    func extraSetupConfiguration() {
        self.turnOnConstraintsBasedOn(traitCollection)
    }
}
