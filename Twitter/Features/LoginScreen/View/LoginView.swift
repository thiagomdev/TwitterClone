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
    }
    
    func setupConstraints() {
        self.logoImageView.activeCenterXBasedOn(inView: self, topAnchor: self.safeAreaLayoutGuide.topAnchor)
        self.logoImageView.setDimensionsBasedOn(width: 150, height: 150)
    }
    
    func extraSetupConfiguration() {
        
    }
}
