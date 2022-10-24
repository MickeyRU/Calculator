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
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 33)
        label.textAlignment = .right
        label.text = ""
        label.textColor = .gray
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
        view.addSubview(historyLabel)
    }
}

extension MainViewController: MainStackViewProtocol {
    
    func numberButtonData(buttonTag: Int) {
        calculationModel.setNumber(number: buttonTag)
        resultLabel.text = calculationModel.getCurrentNumber()
        historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
    }
    
    func actionButtonData(buttonTag: Int) {
        switch buttonTag {
        case 10: // ,
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11: // =
            resultLabel.text = calculationModel.getResult()
        case 12: // +
            resultLabel.text = calculationModel.setOperation(operation: .addition)
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
        case 13: // -
            resultLabel.text = calculationModel.setOperation(operation: .substraction)
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
        case 14: // x
            resultLabel.text = calculationModel.setOperation(operation: .multyplication)
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
        case 15: // /
            resultLabel.text = calculationModel.setOperation(operation: .division)
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
        case 16: // %
            calculationModel.setPercentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
        case 17: // +/-
            historyLabel.text = calculationModel.getCalculationhistore(tag: buttonTag)
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18: // AC
            calculationModel.resetValue()
            resultLabel.text = "0"
            historyLabel.text = ""
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
            
            historyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -10),
            historyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  10),
            historyLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -5),
            
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.bottomAnchor.constraint(equalTo: historyLabel.topAnchor, constant: 5),
            
            
        ])
    }
}

