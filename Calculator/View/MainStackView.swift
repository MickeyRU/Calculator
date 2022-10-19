//
//  MainStackView.swift
//  Calculator
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

//Для передачи данных в вью контроллер используем протокол + слабую ссылку на переменную с делегатом
protocol MainStackViewProtocol: AnyObject {
    
    func numberButtonData(buttonTag: Int)
    
    func actionButtonData(buttonTag: Int)
}

class MainStackView: UIStackView {
    
    private var stackViewsArray = [UIStackView]()
    
    //Слабая переменная с делегатом
    weak var delegate: MainStackViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMainStackView()
        configure()
        stackViewsArray.forEach{ addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Настраиваем основное стек вью
    private func configure() {
        axis = .vertical
        spacing = 1
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func generateButtons (title: String, tag: Int, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.backgroundColor = backgroundColor
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculatorButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func calculatorButtonTapped(sender: UIButton) {
        //Передаем через делегата данные о теге нажатой кнопки, в зависимости от кнопки работают 2 разных метода
        sender.tag < 10 ? delegate?.numberButtonData(buttonTag: sender.tag) : delegate?.actionButtonData(buttonTag: sender.tag)
    }
    
    private func setupMainStackView() {
        let button0 = generateButtons(title: "0", tag: 0, backgroundColor: .gray)
        let buttonComma = generateButtons(title: ",", tag: 10, backgroundColor: .gray)
        let buttonEqually = generateButtons(title: "=", tag: 11, backgroundColor: .orange)
        let firstStackView = UIStackView(subviews: [button0, buttonComma, buttonEqually])
        //Дополнительные настройки размеров трех кнопок
        button0.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.5).isActive = true
        buttonComma.widthAnchor.constraint(equalTo: buttonEqually.widthAnchor, multiplier: 1).isActive = true
        firstStackView.distribution = .fill
        
        let button1 = generateButtons(title: "1", tag: 1, backgroundColor: .gray)
        let button2 = generateButtons(title: "2", tag: 2, backgroundColor: .gray)
        let button3 = generateButtons(title: "3", tag: 3, backgroundColor: .gray)
        let buttonPlus = generateButtons(title: "+", tag: 12, backgroundColor: .orange)
        let secondStackView = UIStackView(subviews: [button1, button2, button3, buttonPlus])
        
        let button4 = generateButtons(title: "4", tag: 4, backgroundColor: .gray)
        let button5 = generateButtons(title: "5", tag: 5, backgroundColor: .gray)
        let button6 = generateButtons(title: "6", tag: 6, backgroundColor: .gray)
        let buttonMinus = generateButtons(title: "-", tag: 13, backgroundColor: .orange)
        let thirdStackView = UIStackView(subviews: [button4, button5, button6, buttonMinus])
        
        let button7 = generateButtons(title: "7", tag: 7, backgroundColor: .gray)
        let button8 = generateButtons(title: "8", tag: 8, backgroundColor: .gray)
        let button9 = generateButtons(title: "8", tag: 9, backgroundColor: .gray)
        let buttonMultiply = generateButtons(title: "x", tag: 14, backgroundColor: .orange)
        let fourthStackView = UIStackView(subviews: [button7, button8, button9, buttonMultiply])
        
        let buttonAC = generateButtons(title: "AC", tag: 18, backgroundColor: .darkGray)
        let buttonPlusMinus = generateButtons(title: "+/-", tag: 17, backgroundColor: .darkGray)
        let buttonPercent = generateButtons(title: "%", tag: 16, backgroundColor: .darkGray)
        let buttonSplit = generateButtons(title: "/", tag: 15, backgroundColor: .orange)
        let fivestackView = UIStackView(subviews: [buttonAC, buttonPlusMinus, buttonPercent, buttonSplit])
        
        stackViewsArray = [fivestackView, fourthStackView, thirdStackView, secondStackView, firstStackView]
    }
}
