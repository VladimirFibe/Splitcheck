//
//  TipCell.swift
//  Splitcheck
//
//  Created by Vladimir Fibe on 23.08.2022.
//

import UIKit

class TipCell: UICollectionViewCell {
  let titleLabel: UILabel = {
    $0.text = "0%"
    $0.textColor = .black
    $0.font = UIFont(name: "Avenir Next Bold", size: 24)
    $0.textAlignment = .center
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  
  override var isSelected: Bool {
    didSet {
      contentView.layer.borderWidth = isSelected ? 1 : 0
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    contentView.layer.cornerRadius = 10
    contentView.layer.borderColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
    contentView.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
    contentView.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
    ])
  }
  
  func configure(with number: Int) {
    titleLabel.text = "\(number)%"
    print(isSelected)
  }
}
