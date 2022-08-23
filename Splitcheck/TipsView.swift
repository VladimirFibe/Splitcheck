//
//  TipsView.swift
//  Splitcheck
//
//  Created by Vladimir Fibe on 23.08.2022.
//

import SwiftUI

class TipsView: CustomView {
  var selected: Int?
  let tips = [0, 10, 15, 20]
  let collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  override func configureUI() {
    titleLabel.text = "Tips"
    backView.backgroundColor = .clear
    backView.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(TipCell.self, forCellWithReuseIdentifier: "Cell")
    NSLayoutConstraint.activate([
      collectionView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
      collectionView.heightAnchor.constraint(equalTo: collectionView
        .widthAnchor, multiplier: 0.2),
    ])
  }
}

extension TipsView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TipCell else { return UICollectionViewCell() }
    cell.isSelected = selected == indexPath.item
    cell.configure(with: tips[indexPath.item])
    return cell
  }
}

extension TipsView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selected = indexPath.item
  }
}

extension TipsView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width / 5,
           height: collectionView.frame.height)
  }
}
struct TipsViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> TipsView {
    TipsView()
  }
  
  func updateUIView(_ uiView: TipsView, context: Context) {
    
  }
}

struct TipsView_Previews: PreviewProvider {
  static var previews: some View {
    TipsViewRepresentable()
  }
}
