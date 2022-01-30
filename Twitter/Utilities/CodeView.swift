//
//  CodeView.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//
import UIKit
protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func extraSetupConfiguration()
    func setup()
    
}
extension CodeView {
    func setup() {
        buildViewHierarchy()
        setupConstraints()
        extraSetupConfiguration()
    }
}
