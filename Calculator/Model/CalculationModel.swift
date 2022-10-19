//
//  CalculationModel.swift
//  Calculator
//
//  Created by Павел Афанасьев on 18.10.2022.
//

import Foundation

class CalculationModel {
    
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction
    
    // При вводе разных чисел в калькулятор - складывает с строку все значения
    public func setNumber(number: Int) {
        
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        }
        
        if number == 0 && currentNumber == "0"{
            currentNumber.removeLast()
        }
        
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        return currentNumber
    }
    
    public func setOperation(operation: Operations) -> String {
        
        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return ""}
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else { return ""}
            firstNumber = result
        }
        
        currentNumber = ""
        currentOperation = operation
        return String(firstNumber)
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number
        
        switch currentOperation {
        case .noAction:
            print("noAction")
            return "noAction"
        case .addition: // Cложение
            return String(firstNumber + secondNumber)
        case .substraction: // Вычитание
            return String(firstNumber - secondNumber)
        case .multyplication: // Умножение
            return String(firstNumber * secondNumber)
        case .division: // Деление
            if secondNumber == 0 {
                return "Не определено"
            } else {
                return String(firstNumber / secondNumber)
            }
        }
    }
    
    public func resetValue() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = Operations.noAction
        
    }
    
    public func invertValue() {
        guard let number = Double(currentNumber) else { return }
        
        if number > 0 {
            currentNumber.insert("-", at: currentNumber.startIndex)
        } else {
            currentNumber.remove(at: currentNumber.startIndex)
        }

    }
    
    public func addPointValue() {
        if currentNumber != "" {
            currentNumber += "."
        } else {
            currentNumber += "0."
        }
    }
    
    public func setPercentNumber() {
        guard let number = Double(currentNumber) else { return }
        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
