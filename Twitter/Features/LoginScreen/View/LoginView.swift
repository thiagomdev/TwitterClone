//
//  LoginView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LoginView: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func extraSetupConfiguration() {
        
    }
}
