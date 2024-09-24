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
    private let imageView = UIImageView()
    private let imageContainerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateNumbers()
        
        setupTextLabel()
        setupImageContainerView()
        setupImageView()
        setupView()
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
    
    private func setupTextLabel() {
        let firstNumber = helper.getNumbers().first
        textlabel.text = firstNumber?.formatted()
        textlabel.font = .systemFont(ofSize: 30, weight: .bold)
        textlabel.textColor = .red
    }

    private func setupImageContainerView() {
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 15
        imageContainerView.layer.cornerRadius = 20
        imageContainerView.backgroundColor = .cyan
        
        imageContainerView.addSubview(imageView)
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "raccoon")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
        
        view.addSubview(textlabel)
        view.addSubview(imageContainerView)
    }
    
    private func setupLayout() {
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageContainerView.topAnchor.constraint(equalTo: textlabel.bottomAnchor, constant: 150),
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            imageContainerView.widthAnchor.constraint(equalToConstant: 200),
            
            imageView.leftAnchor.constraint(equalTo: imageContainerView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: imageContainerView.rightAnchor),
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor)
        ])
    }
}

