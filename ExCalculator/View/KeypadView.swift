//
//  KeypadView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/5/24.
//

import UIKit

protocol KeypadViewDelegate: AnyObject {
    func tappedKeyPadButton(with titleNumber: String)
}

final class KeypadView: UIView {
    let buttonTitles: [[String]]
    
    weak var delegate: KeypadViewDelegate?
    
    init(titles: [[String]]) {
        self.buttonTitles = titles
        super.init(frame: .zero)
        
        let hStackViews = buttonTitles.map { makeHorizontalStackView(makeKeypadButton($0))}
        let stackView = makeVerticalStackView(hStackViews)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            
            button.layoutIfNeeded()
            button.layer.cornerRadius = height / 2
            
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
}
