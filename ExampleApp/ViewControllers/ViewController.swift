//
//  ViewController.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 15.09.24.
//

import UIKit

class ViewController: UIViewController {

    private let textlabel = UILabel()
    private let shadowView = ShadowView(imageName: ShadowViewType.raccoon.rawValue)
    private let stackView = UIStackView()
    private let numberButton = CustomButton(textButton: "ChangeButton", bgColor: .systemRed)
    private let imageButton = CustomButton(textButton: "Change image", bgColor: .systemGreen)
    
    var helper: NumberManageable?
    
    private var isOneRaccoon = true
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNumbers()
        view.addGradient()
        
        setupTextLabel()
        setupStackView()
        view.addSubview(stackView)
        addAction()
        
        setupLayout()
    }
    
    private func updateNumbers() {
        helper?.addNumber(randomNumber)
        helper?.addNumber(randomNumber)
        helper?.addNumber(randomNumber)
    }
    
    @objc
    private func numberButtonTapped() {
        textlabel.text = helper?.getRandomNumber().formatted()
    }
}

// MARK: - Setup View
private extension ViewController {
    
    func addAction() {
        numberButton.addTarget(
            self,
            action: #selector(numberButtonTapped),
            for: .touchUpInside)
        
        let action = UIAction { _ in
            self.isOneRaccoon.toggle()
            
            let randomImageName = self.isOneRaccoon
            ? ShadowViewType.raccoon
            : ShadowViewType.custom
            
            
            self.shadowView.updateImage(randomImageName.rawValue)
        }
        
        imageButton.addAction(action, for: .touchUpInside)
        
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(textlabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(numberButton)
        stackView.addArrangedSubview(imageButton)
    }
    
    func setupTextLabel() {
        let firstNumber = helper?.getNumbers().first
        textlabel.text = firstNumber?.formatted()
        textlabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textlabel.textAlignment = .center
        textlabel.textColor = .systemRed
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
            
            shadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor)
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

