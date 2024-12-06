//
//  CalculatorView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/5/24.
//

import UIKit

final class CalculatorView: UIView {
    private let resultLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .right
        label.lineBreakMode = .byTruncatingHead
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    private let keypadView = KeypadView(titles: [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"],
    ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ target: KeypadViewDelegate) {
        keypadView.delegate = target
    }
    
    func setResultLabel(to value: String) {
        DispatchQueue.main.async {
            self.resultLabel.text = value
        }
    }
    
    private func layoutViews() {
        addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(keypadView)
        keypadView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keypadView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            keypadView.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            keypadView.heightAnchor.constraint(equalTo: keypadView.widthAnchor),
            keypadView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:  -60),
        ])
    }
}
