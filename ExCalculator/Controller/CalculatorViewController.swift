//
//  CalculatorViewController.swift
//  ExCalculator
//
//  Created by 강동영 on 11/11/24.
//

import UIKit

final class CalculatorViewController: UIViewController {
    private let model: CalculatorModel
    private let calculatorView: CalculatorViewAble
    
    init(model: CalculatorModel, view: CalculatorViewAble) {
        self.model = model
        self.calculatorView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        calculatorView.setDelegate(self)
        view = (calculatorView as! UIView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        model.didChangedResultBuffer = { [unowned self] in
            self.calculatorView.setResultLabel(to: $0)
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
    CalculatorViewController(
        model: CalculatorModel(),
        view: CalculatorView(frame: .zero)
    )
}
