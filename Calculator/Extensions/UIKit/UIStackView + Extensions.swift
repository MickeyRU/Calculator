//
//  UIStackView + Extensions.swift
//  Calculator
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually    
    }
}
