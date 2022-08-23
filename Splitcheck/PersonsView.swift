//
//  PersonsView.swift
//  Splitcheck
//
//  Created by Vladimir Fibe on 23.08.2022.
//

import SwiftUI

class PersonsView: CustomView {

  var count = 0 {
    didSet {
      countLabel.text = "\(count)"
      minusButton.isEnabled = count > 0
    }
  }
  
  let countLabel: UILabel = {
    $0.text = "0"
    $0.font = UIFont(name: "Avenir Next", size: 40)
    $0.textAlignment = .center
    return $0
  }(UILabel())

  let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
  
  lazy var minusButton: UIButton = {
    $0.setImage(UIImage(systemName: "minus", withConfiguration: largeConfig), for: .normal)
    $0.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
    $0.tag = 0
    $0.isEnabled = false
    $0.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
    return $0
  }(UIButton(type: .system))
  
  lazy var plusButton: UIButton = {
    $0.setImage(UIImage(systemName: "plus", withConfiguration: largeConfig), for: .normal)
    $0.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
    $0.tag = 1
    $0.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
    return $0
  }(UIButton(type: .system))
  
  lazy var stack: UIStackView = {
    $0.axis = .horizontal
    $0.distribution = .equalSpacing
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton]))
  override func configureUI() {
    titleLabel.text = "Persons"
    backView.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: backView.leadingAnchor, multiplier: 3),
      backView.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 3)
    ])
  }
  
  @objc func buttonTapped(_ sender: UIButton) {
    if sender.tag == 0 {
      if count > 0 { count -= 1 }
    } else {
      count += 1
    }
  }
}

struct PersonsViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> PersonsView {
    PersonsView()
  }
  
  func updateUIView(_ uiView: PersonsView, context: Context) {
    
  }
}

struct PersonsView_Previews: PreviewProvider {
  static var previews: some View {
    PersonsViewRepresentable()
  }
}
