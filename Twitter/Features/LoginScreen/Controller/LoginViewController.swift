//
//  ViewController.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    private let loginView: LoginView
        
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    init() {
        self.loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
        self.loginView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func configureUI() {
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isHidden = true
    }
}
extension LoginViewController: LoginViewDelegate {
    func gotToSignUPView() {
        let signUp = RegisterViewController()
        self.navigationController?.pushViewController(signUp, animated: true)
    }
}

