//
//  CalulatorView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/7/24.
//

import SwiftUI

struct CalulatorView: View {
    @StateObject private var model: CalculatorModel = .init()
    
    var body: some View {
        Spacer()
        Text(model.resultBuffer)
            .font(.system(size: 60))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)
        Spacer()
        
        KeypadView(model: model)
        .padding(.all)
    }
}

#Preview {
    CalulatorView()
}
