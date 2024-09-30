//
//  UIView+Gradient.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 30.09.24.
//

import UIKit

extension UIView {
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        layer.insertSublayer(gradient, at: 0)
    }
}
