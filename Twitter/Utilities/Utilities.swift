//
//  Utilities.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit

class Utilities {
    func turnOnContainerView(with imageView: UIImage?, textField: UITextField) -> UIView {
        let view = UIView()
        let image = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.image = imageView
        view.addSubview(image)
        
        image.turnOnPinTo(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        image.turnOnDimenssion(toWidth: 24, toHeight: 24)
        view.addSubview(textField)
        textField.turnOnPinTo(left: image.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let divider = UIView()
        divider.backgroundColor = .white
        divider.alpha = 0.6
        view.addSubview(divider)
        divider.turnOnPinTo(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        return view
    }
    
    func turnOnTextField(with placeholder: String, font: UIFont?) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = .white
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }
    
    func turnOnButton(textOne: String, textTwo: String) -> UIButton {
        let button = UIButton(type: .system)
        let attibutedTitle = NSMutableAttributedString(string: textOne, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attibutedTitle.append(NSAttributedString(string: textTwo, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attibutedTitle, for: .normal)
        return button
    }
}
