//
//  RegisterView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit

class RegisterView: UIView {
    // MARK: - Properties
    
    // MARK: - Components
    
    // MARK: - Lifecicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    // MARK: - Methods
}

    // MARK: - Extensions
extension RegisterView: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func extraSetupConfiguration() {
        
    }
}
