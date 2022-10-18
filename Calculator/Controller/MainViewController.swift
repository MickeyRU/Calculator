//
//  ViewController.swift
//  Calculator
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainStackView = MainStackView()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(mainStackView)
    }
}

extension MainViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1)
        ])
    }
}

