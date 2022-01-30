//
//  Utilities.swift
//  Twitter
//
//  Created by Thiago Monteiro on 30/01/22.
//

import UIKit

class Utilities {
    func activeContainerViewBasedOn(with imageView: UIImage?, textField: UITextField) -> UIView {
        let view = UIView()
        let image = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.image = imageView
        view.addSubview(image)
        image.activeAnchorBasedOn(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        image.setDimensionsBasedOn(width: 24, height: 24)
        view.addSubview(textField)
        textField.activeAnchorBasedOn(left: image.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        return view
    }
    
    func activeTextField(with placeholder: String, font: UIFont?) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = .white
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }
}
