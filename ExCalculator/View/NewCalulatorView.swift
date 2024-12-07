//
//  NewCalulatorView.swift
//  ExCalculator
//
//  Created by 강동영 on 12/7/24.
//

import SwiftUI

struct NewCalulatorView: View {
    var body: some View {
        Spacer()
        Text("123")
            .font(.system(size: 60))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)
        Spacer()
        VStack {
            HStack {
                Button(action: {}) {
                    Text("7")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("8")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("9")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("+")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color.orange)
                .cornerRadius(50)
            }
            HStack {
                Button(action: {}) {
                    Text("4")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("5")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("6")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("-")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color.orange)
                .cornerRadius(50)
            }
            HStack {
                Button(action: {}) {
                    Text("1")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("2")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("3")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("*")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color.orange)
                .cornerRadius(50)
            }
            HStack {
                Button(action: {}) {
                    Text("AC")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color.orange)
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("0")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(uiColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)))
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("=")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color.orange)
                .cornerRadius(50)
                
                Button(action: {}) {
                    Text("/")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color.orange)
                .cornerRadius(50)
            }
        }
        .padding(.all)
    }
}

#Preview {
    NewCalulatorView()
}
