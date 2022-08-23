//
//  CustomTextField.swift
//  Splitcheck
//
//  Created by Vladimir Fibe on 23.08.2022.
//

import SwiftUI

class CustomTextField: CustomView {

  let textField: UITextField = {
    $0.placeholder = "Enter bill"
    $0.textColor = .black
    $0.font = UIFont(name: "Avenir Next", size: 40)
    $0.tintColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
    $0.textAlignment = .center
    $0.keyboardType = .numberPad
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITextField())

  override func configureUI() {
    addSubview(textField)
    NSLayoutConstraint.activate([
      textField.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
      textField.leadingAnchor.constraint(equalToSystemSpacingAfter: backView.leadingAnchor, multiplier: 1),
      backView.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1)
    ])
  }
}

struct CustomTextFieldRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> CustomTextField {
    CustomTextField()
  }
  
  func updateUIView(_ uiView: CustomTextField, context: Context) {
    
  }
}

struct CustomTextField_Previews: PreviewProvider {
  static var previews: some View {
    CustomTextFieldRepresentable()
  }
}
