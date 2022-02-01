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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    // MARK: - Methods
}

extension RegisterViewController: RegisterViewDelegate {
    func backToLogIn() {
        self.navigationController?.popViewController(animated: true)
    }
}
