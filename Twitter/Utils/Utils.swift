//
//  Utilities.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit

class Utils {
    func makeView(with imageView: UIImage?, textField: UITextField) -> UIView {
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
    
    func makeTextField(with placeholder: String, font: UIFont?) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.textColor = .white
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }
    
    func makeTextFieldAttributedText(textColor: UIColor?, font: UIFont?, placeholder: String?) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes:[NSAttributedString.Key.foregroundColor: textColor as Any])
        textField.textAlignment = .center
        textField.font = font
        textField.keyboardType = .numberPad
        textField.borderStyle = .none
        textField.textColor = textColor
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        return textField
    }
    
    func makeButton(textOne: String, textTwo: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let attibutedTitle = NSMutableAttributedString(string: textOne, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attibutedTitle.append(NSAttributedString(string: textTwo, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attibutedTitle, for: .normal)
        return button
    }
    
    func makeStack(withSpacing space: CGFloat, axis: NSLayoutConstraint.Axis, backgroundColor: UIColor?, distribution: UIStackView.Distribution? = nil) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = space
        stack.axis = axis
        stack.distribution = distribution ?? .fillEqually
        stack.backgroundColor = backgroundColor
        return stack
    }
    
    func makeButtonWith(icon: UIImage?, textColor: UIColor?, font: UIFont?) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = font
        button.clipsToBounds    = true
        return button
    }
    
    func makeDivider(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundColor
        return view
    }
}
