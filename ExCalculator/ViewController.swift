//
//  ViewController.swift
//  ExCalculator
//
//  Created by 강동영 on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    private let resultLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let stackView = makeHorizontalStackView(makeKeypadButton(["7", "8", "9", "+"]))
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: resultLabel.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    private func makeKeypadButton(_ titles: [String]) -> [UIButton] {
        titles.map {
            let button: UIButton = UIButton()
            button.setTitle($0, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.frame.size = CGSize(width: 80, height: 80)
            button.layer.cornerRadius = 40
            return button
        }
    }
    
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        views.forEach { horizontalStackView.addArrangedSubview($0) }
        return horizontalStackView
    }
    
}

