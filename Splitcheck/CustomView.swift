//
//  CustomView.swift
//  Splitcheck
//
//  Created by Vladimir Fibe on 23.08.2022.
//

import SwiftUI

class CustomView: UIView {
  let titleLabel: UILabel = {
    $0.text = "Total Bill"
    $0.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
    $0.font = UIFont(name: "Avenir Next", size: 14)
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textAlignment = .center
    return $0
  }(UILabel())
  
  let backView: UIView = {
    $0.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
    $0.layer.cornerRadius = 10
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIView())
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setConstraints()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    addSubview(titleLabel)
    addSubview(backView)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      
      backView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
      trailingAnchor.constraint(equalTo: backView.trailingAnchor),
      backView.heightAnchor.constraint(equalToConstant: 82),
      bottomAnchor.constraint(equalToSystemSpacingBelow: backView.bottomAnchor, multiplier: 1)
    ])
  }
  
  func configureUI() {
    
  }
}

struct CustomViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> CustomView {
    CustomView()
  }
  
  func updateUIView(_ uiView: CustomView, context: Context) {
    
  }
}

struct CustomView_Previews: PreviewProvider {
  static var previews: some View {
    CustomViewRepresentable()
  }
}
