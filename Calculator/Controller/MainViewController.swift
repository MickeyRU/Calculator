//
//  ViewController.swift
//  Calculator
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainStackView = MainStackView()
    private let calculationModel = CalculationModel()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 66)
        label.textAlignment = .right
        label.text = "0"
        label.textColor = .white
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        mainStackView.delegate = self
        view.backgroundColor = .black
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
    }
}

extension MainViewController: MainStackViewProtocol {
    
    func numberButtonData(buttonTag: Int) {
        calculationModel.setNumber(number: buttonTag)
        resultLabel.text = calculationModel.getCurrentNumber()
    }
    
    func actionButtonData(buttonTag: Int) {
        switch buttonTag {
        case 10: // ,
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11: // =
            resultLabel.text = calculationModel.getResult()
        case 12: // +
            resultLabel.text = calculationModel.setOperation(operation: .addition)
        case 13: // -
            resultLabel.text = calculationModel.setOperation(operation: .substraction)
        case 14: // x
            resultLabel.text = calculationModel.setOperation(operation: .multyplication)
        case 15: // /
            resultLabel.text = calculationModel.setOperation(operation: .division)
        case 16: // %
            calculationModel.setPercentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()

        case 17: // +/-
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18: // AC
            calculationModel.resetValue()
            resultLabel.text = "0"
        default:
            print("default")
        }
    }
}

extension MainViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1),
            
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 5)
        ])
    }
}

