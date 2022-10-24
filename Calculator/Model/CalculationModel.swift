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
    private var curretnHistory = ""
    
    private func setInvertVistoryValue() {
        guard let number = Double(currentNumber) else { return }
        
        switch number {
        case ..<0:
            let index = curretnHistory.index(curretnHistory.endIndex, offsetBy: -2)
            curretnHistory.remove(at: index)
        case 0:
            break
        case 0...:
            let index = curretnHistory.index(before: curretnHistory.endIndex)
            curretnHistory.insert("-", at: index)
            
        default:
            print("InvertVistoryValue error")
        }
        
    }
    
    public func getCalculationhistore(tag: Int) -> String {
        
        switch tag {
        case 0...9:
            curretnHistory += "\(tag)"
        case 10:
            if !currentNumber.contains(".") {
                curretnHistory += ","
            }
        case 12...15:
            guard let last = curretnHistory.last else { break }
            if last == "+" ||
                last == "-" ||
                last == "*" ||
                last == "/" {
                curretnHistory.removeLast()
            }
            curretnHistory += currentOperation.rawValue
        case 16:
            curretnHistory += "%"
        case 17:
            setInvertVistoryValue()
        default:
            print("history tag")
            break
        }
        return curretnHistory
    }
    
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
        currentNumber.stringWithPoint
    }
    
    public func setOperation(operation: Operations) -> String {
        
        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return "0"}
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else {
                currentOperation = operation
                return firstNumber.stringWithoutZeroFraction.stringWithPoint}
            firstNumber = result
        }
        
        currentNumber = ""
        currentOperation = operation
        return firstNumber.stringWithoutZeroFraction.stringWithPoint
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number
        
        var result = 0.0
        
        switch currentOperation {
        case .noAction:
            return currentNumber
        case .addition: // Cложение
            result = firstNumber + secondNumber
        case .substraction: // Вычитание
            result = firstNumber - secondNumber
        case .multyplication: // Умножение
            result = firstNumber * secondNumber
        case .division: // Деление
            if secondNumber == 0 {
                return "Не определено"
            } else {
                result = firstNumber / secondNumber
            }
        }
        return result.stringWithoutZeroFraction.stringWithPoint
    }
    
    public func resetValue() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = Operations.noAction
        curretnHistory = ""
    }
    
    public func invertValue() {
        guard let number = Double(currentNumber) else {
            currentNumber = "0"
            return }
        
        switch number {
        case ..<0:
            currentNumber.remove(at: currentNumber.startIndex)
        case 0: break
        case 0...:
            currentNumber.insert("-", at: currentNumber.startIndex)
        default:
            print("error invert value")
        }
    }
    
    public func addPointValue() {
        
        if !currentNumber.contains("."){
            currentNumber += currentNumber != "" ? "." : "0."
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
