//
//  Helper.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 15.09.24.
//

import Foundation

class Helper {
    private var numbers: [Int] = []
    
    func addNumber(_ number: Int) {
        numbers.append(number)
    }
    
    func getNumbers() -> [Int] {
        numbers
    }
    
    func getRandomNumber() -> Int {
        numbers.randomElement() ?? 0
    }
}
