//
//  LoginView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit
protocol LoginViewDelegate: AnyObject {
    func gotToSignUPView()
}
class LoginView: UIView {
    // MARK: - Properties
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Components
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "TwitterLogo")
        return image
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
        
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(turnOnLoginButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let noAccount: UIButton = {
        let button = Utilities().turnOnButton(textOne: "Don't have an account? ", textTwo: " Sign Up")
        button.addTarget(self, action: #selector(goToSignUp(_:)), for: .touchUpInside)
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
    @objc func turnOnLoginButton(_ sender: UIButton) {
        
    }
    
    @objc func goToSignUp(_ sender: UIButton) {
        self.delegate?.gotToSignUPView()
    }
    
    // MARK: - Methods
    
}

    // MARK: - Extensions
extension LoginView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(logoImageView)
        self.addSubview(stack)
        self.stack.addArrangedSubview(emailContainerView)
        self.stack.addArrangedSubview(passwordContainerView)
        self.stack.addArrangedSubview(loginButton)
        self.addSubview(noAccount)
    }
    
    func setupConstraints() {
        self.logoImageView.turnOnCenterX(toView: self, topAnchor: self.safeAreaLayoutGuide.topAnchor)
        self.logoImageView.turnOnDimenssion(toWidth: 150, toHeight: 150)
        
        self.stack.turnOnPinTo(top: self.logoImageView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingLeft: 38, paddingRight: 38)
        self.noAccount.turnOnPinTo(left: self.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
    
    func extraSetupConfiguration() {
        
    }
}
