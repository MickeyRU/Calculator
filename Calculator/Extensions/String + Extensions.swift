//
//  String + Extensions.swift
//  Calculator
//
//  Created by Павел Афанасьев on 23.10.2022.
//

import Foundation

extension String {
    // Если в строке присутствует точка - заменяем ее на запятую или просто возвращаем исходное значение
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
