//
//  LstAllCell.swift
//  Yamaha
//
//  Created by SmartVenture on 5/10/23.
//

import Foundation
import UIKit

class LstAllCell: UICollectionViewCell {
  
  static let identifier = "LstAllCell"
  
  
  // UI Components
  
  private let wrapTwoLabels: UIView = {
    let wtl = UIView()
    
    return wtl
  }()
  
  private let lstAllImage: UIImageView = {
    let pi = UIImageView()
    pi.image = UIImage(systemName: "questionmark")
    pi.contentMode = .scaleAspectFit
    pi.clipsToBounds = true
    pi.tintColor = .systemPink
    return pi
  }()
  
  private let lstAllName: UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textColor = .label
    return label
  }()
  
  private let qty: UILabel = {
    let label = UILabel()
    label.text = "Price"
    label.textColor = .label
    return label
  }()
  
  // Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func setLstAll(with lstAll: LstAll) {
    self.lstAllName.text = lstAll.lstAllName
    self.qty.text = "\(lstAll.quantity) qty"
    
    let url = URL(string: lstAll.image)

    if let u = url, let imageData = try? Data(contentsOf: u) {
      self.lstAllImage.image = UIImage(data: imageData)
    }
  }
  
  // Setup UI
  private func setupUI() {
  
    self.contentView.addSubview(lstAllImage)
    self.contentView.addSubview(wrapTwoLabels)
    
    wrapTwoLabels.addSubview(lstAllName)
    wrapTwoLabels.addSubview(qty)
    
    lstAllImage.translatesAutoresizingMaskIntoConstraints = false
    lstAllName.translatesAutoresizingMaskIntoConstraints = false
    qty.translatesAutoresizingMaskIntoConstraints = false
    wrapTwoLabels.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
      
      lstAllImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
      lstAllImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
      lstAllImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
      lstAllImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6),
     
      wrapTwoLabels.topAnchor.constraint(equalTo: lstAllImage.bottomAnchor),
      wrapTwoLabels.leadingAnchor.constraint(equalTo: lstAllImage.leadingAnchor),
      wrapTwoLabels.trailingAnchor.constraint(equalTo: lstAllImage.trailingAnchor),
      
      lstAllName.leadingAnchor.constraint(equalTo: wrapTwoLabels.leadingAnchor),
      lstAllName.widthAnchor.constraint(equalTo: wrapTwoLabels.widthAnchor, multiplier: 0.5),
      
      qty.trailingAnchor.constraint(equalTo: lstAllImage.trailingAnchor)
      
      ])
  }
  
  
}
