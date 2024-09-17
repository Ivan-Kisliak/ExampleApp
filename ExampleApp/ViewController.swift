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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
        view.addSubview(textlabel)
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

}

