//
//  Double + Extencions.swift
//  Calculator
//
//  Created by Павел Афанасьев on 23.10.2022.
//

import Foundation

extension Double {
    // гц%.0f - позволяет игнорировать любые дробные части
    var stringWithoutZeroFraction: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
