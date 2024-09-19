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
        
        setupLabel()
        setupImageContainerView()
        setupImageView()
        setupView()
        
        view.addSubview(textlabel)
        view.addSubview(imageContainerView)
        
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textlabel.text = firstNumber?.formatted()
        textlabel.font = .systemFont(ofSize: 30, weight: .bold)
        textlabel.textColor = .red
        textlabel.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
    }

    private func setupImageContainerView() {
        imageContainerView.frame = CGRect(x: 30, y: 130, width: 100, height: 200)
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 15
        
        imageContainerView.addSubview(imageView)
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "raccoon")
        imageView.frame = imageContainerView.bounds
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }

}

