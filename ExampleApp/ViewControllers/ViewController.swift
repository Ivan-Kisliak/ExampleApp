//
//  ViewController.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 15.09.24.
//

import UIKit

class ViewController: UIViewController {

    private let helper = Helper()
    
    private let textlabel = UILabel()
    private let shadowView = ShadowView(imageName: ShadowViewType.raccoon.rawValue)
    private let secondShadowView = ShadowView(imageName: ShadowViewType.custom.rawValue)
    private let stackView = UIStackView()
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateNumbers()
        
        setupTextLabel()
        view.addGradient()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(randomNumber)
    }
}

// MARK: - Setup View
private extension ViewController {
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textlabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(secondShadowView)
    }
    
    func setupTextLabel() {
        let firstNumber = helper.getNumbers().first
        textlabel.text = firstNumber?.formatted()
        textlabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textlabel.textAlignment = .center
        textlabel.textColor = .red
    }
}


// MARK: - Setup Layout
private extension ViewController {
    
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
        ])
    }
}

// MARK: - Nested types
extension ViewController {
    
    enum ShadowViewType: String {
        case raccoon = "raccoon"
        case custom = "custom"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
    }
}

