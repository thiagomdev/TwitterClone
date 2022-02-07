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
        image.image = AllImage().logoImage
        return image
    }()
    
    lazy var emailContainerView: UIView = {
        let email = AllImage().emailImage
        let view = Utils().makeView(with: email,
        textField: emailTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let password = AllImage().passwordImage
        let view = Utils().makeView(with: password,
        textField: passwordTextField)
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
        let email = Utils().makeTextField(with: AllText().emailPlaceholderText,
        font: .systemFont(ofSize: 16))
        return email
    }()
    
    private let passwordTextField: UITextField = {
        let password = Utils().makeTextField(with: AllText().passwordPlaceholderText,
        font: .systemFont(ofSize: 16))
        password.isSecureTextEntry = true
        return password
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(AllText().logInText, for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(turnOnLoginButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let noAccount: UIButton = {
        let button = Utils().makeButton(textOne: AllText().dontHaveAccountText, textTwo: AllText().signUpText)
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
        print("login button tapped")
    }
    
    @objc func goToSignUp(_ sender: UIButton) {
        self.delegate?.gotToSignUPView()
    }
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
        
        self.stack.turnOnPinTo(top: logoImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 38, paddingRight: 38)
        self.noAccount.turnOnPinTo(left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
    
    func extraSetupConfiguration() { }
}
