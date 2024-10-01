//
//  CustomButton.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 1.10.24.
//

import UIKit

class CustomButton: UIButton {
    init(textButton: String, bgColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bgColor: bgColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup View

private extension CustomButton {
    func setupButton(text: String, bgColor: UIColor) {
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = Constant.cornerRadius
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

//MARK: - Constants

private extension CustomButton {
    enum Constant {
        static let cornerRadius: CGFloat = 10
    }
}
