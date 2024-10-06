//
//  Helper.swift
//  ExampleApp
//
//  Created by  Ivan Kiskyak on 15.09.24.
//

import Foundation

protocol NumberManageable {
    func addNumber(_ number: Int)
    func getNumbers() -> [Int]
    func getRandomNumber() -> Int
}

class Helper: NumberManageable {
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

class NewHelper: NumberManageable {
    func addNumber(_ number: Int) {
        print("add \(number) in array")
    }
    
    func getNumbers() -> [Int] {
        []
    }
    
    func getRandomNumber() -> Int {
        0
    }
    
}
