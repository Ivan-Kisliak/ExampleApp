//
//  ViewController.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 15.09.24.
//

import UIKit

class ViewController: UIViewController {

    private let helper = Helper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNumbers()

    }
    
    func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }

}

