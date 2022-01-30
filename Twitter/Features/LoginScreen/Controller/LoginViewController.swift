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
    
    // MARK: - Components
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    init() {
        self.loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    // MARK: - Methods
}

