//
//  CalculatorViewController.swift
//  ExCalculator
//
//  Created by 강동영 on 11/11/24.
//

import UIKit

final class CalculatorViewController: UIViewController {
    private let model: CalculatorModel = .init()
    private let calculatorView: CalculatorView = .init()
    
    override func loadView() {
        calculatorView.setDelegate(self)
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        model.didChangedResultBuffer = { [weak self] in
            self?.calculatorView.setResultLabel(to: $0)
        }
    }
}

extension CalculatorViewController: KeypadViewDelegate {
    func tappedKeyPadButton(with buttonTitle: String) {
        model.tappedKeyPadButton(with: buttonTitle)
    }
}

@available(iOS 17.0, *)
#Preview {
    CalculatorViewController()
}
