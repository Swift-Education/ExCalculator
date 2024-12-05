//
//  CalculatorView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/5/24.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    func tappedKeyPadButton(with titleNumber: String)
}

final class CalculatorView: UIView {
    let resultLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .right
        label.lineBreakMode = .byTruncatingHead
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    weak var delegate: CalculatorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let buttonTitles: [[String]] = [
            ["7", "8", "9", "+"],
            ["4", "5", "7", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"],
        ]
        let hStackViews = buttonTitles.map { makeHorizontalStackView(makeKeypadButton($0))}
        let stackView = makeVerticalStackView(hStackViews)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 200),
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:  -60),
        ])
    }
    
    private func makeKeypadButton(_ titles: [String]) -> [UIButton] {
        titles.map {
            let button: UIButton = UIButton()
            button.setTitle($0, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            
            let grayColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            let orangeColor = UIColor.orange
            let orangeTitles: Set<String> = ["+", "-", "*", "/", "=", "AC"]
            button.backgroundColor = orangeTitles.contains($0) ? orangeColor : grayColor
            
            let height: CGFloat = 80
            button.layer.cornerRadius = height / 2
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            
            button.addAction(UIAction(handler: tappedKeyPadButton), for: .touchUpInside)
            return button
        }
    }
    
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        views.forEach { horizontalStackView.addArrangedSubview($0) }
        return horizontalStackView
    }
    
    private func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .vertical
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        views.forEach { horizontalStackView.addArrangedSubview($0) }
        return horizontalStackView
    }
    
    private func tappedKeyPadButton(_ action: UIAction) {
        guard let button = action.sender as? UIButton,
              let buttonTitle = button.title(for: .normal)
        else { return }
        delegate?.tappedKeyPadButton(with: buttonTitle)
    }
    
    private func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}


@available(iOS 17.0, *)
#Preview {
    CalculatorViewController()
}
