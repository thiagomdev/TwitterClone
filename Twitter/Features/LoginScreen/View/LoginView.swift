//
//  LoginView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class LoginView: UIView {
    // MARK: - Properties
    
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
        let view = Utilities().activeContainerViewBasedOn(with: email, textField: emailTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let password = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().activeContainerViewBasedOn(with: password, textField: passwordTextField)
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private let emailTextField: UITextField = {
        let email = Utilities().activeTextField(with: "Email", font: .systemFont(ofSize: 16))
        return email
    }()
    
    private let passwordTextField: UITextField = {
        let password = Utilities().activeTextField(with: "Password", font: .systemFont(ofSize: 16))
        return password
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
    
    // MARK: - Selectors
    
    // MARK: - Methods
    
}

    // MARK: - Extensions
extension LoginView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(logoImageView)
        self.addSubview(stack)
        self.stack.addArrangedSubview(emailContainerView)
        self.stack.addArrangedSubview(passwordContainerView)
    }
    
    func setupConstraints() {
        self.logoImageView.activeCenterXBasedOn(inView: self, topAnchor: self.safeAreaLayoutGuide.topAnchor)
        self.logoImageView.setDimensionsBasedOn(width: 150, height: 150)
        
        self.stack.activeAnchorBasedOn(top: self.logoImageView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor)
    }
    
    func extraSetupConfiguration() {
        
    }
}
