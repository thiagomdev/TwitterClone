//
//  RegisterView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    func backToLogIn()
    func showImagePicker()
}

class RegisterView: UIView {
    // MARK: - Properties
    weak var delegate: RegisterViewDelegate?
    public let imagePicker = UIImagePickerController()
    
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
        let view = Utilities().turnOnContainerView(with: email, textField: emailTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let password = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().turnOnContainerView(with: password, textField: passwordTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var fullnameContainerView: UIView = {
        let fullname = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities().turnOnContainerView(with: fullname, textField: fullnameTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var usernameContainerView: UIView = {
        let username = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities().turnOnContainerView(with: username, textField: usernameTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
        
    private let emailTextField: UITextField = {
        let email = Utilities().turnOnTextField(with: "Email", font: .systemFont(ofSize: 16))
        return email
    }()
    
    private let passwordTextField: UITextField = {
        let password = Utilities().turnOnTextField(with: "Password", font: .systemFont(ofSize: 16))
        password.isSecureTextEntry = true
        return password
    }()
    
    private let fullnameTextField: UITextField = {
        let fullname = Utilities().turnOnTextField(with: "Full Name", font: .systemFont(ofSize: 16))
        return fullname
    }()
    
    private let usernameTextField: UITextField = {
        let username = Utilities().turnOnTextField(with: "Username", font: .systemFont(ofSize: 16))
        return username
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
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
        let button = Utilities().turnOnButton(textOne: "Already have an account? ", textTwo: " Log In")
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
    
    // MARK: - Selectors
    @objc func backToLogIn(_ sender: UIButton) {
        self.delegate?.backToLogIn()
    }
    
    @objc func addPhotoButton(_ sender: UIButton) {
        self.delegate?.showImagePicker()
    }
    
    @objc func turnOnRegisterButton(_ sender: UIButton) {
        print("register tapped")
    }
    
    // MARK: - Methods
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
        self.plusPhotoButton.turnOnCenterX(toView: self, topAnchor: self.safeAreaLayoutGuide.topAnchor)
        self.plusPhotoButton.turnOnDimenssion(toWidth: 128, toHeight: 128)
        
        self.stack.turnOnPinTo(top: self.plusPhotoButton.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 32,paddingLeft: 38, paddingRight: 38)
        
        self.alreadyHaveAnAccount.turnOnPinTo(left: self.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
    
    func extraSetupConfiguration() {
    }
}
