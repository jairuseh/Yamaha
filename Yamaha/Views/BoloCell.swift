//
//  BoloCell.swift
//  Yamaha
//
//  Created by SmartVenture on 5/10/23.
//

import Foundation
import UIKit

class BoloCell: UICollectionViewCell {
  
  static let identifier = "BoloCell"
  
  
  // UI Components
  
  private let wrapTwoLabels: UIView = {
    let wtl = UIView()
    
    return wtl
  }()
  
  private let boloImage: UIImageView = {
    let pi = UIImageView()
    pi.image = UIImage(systemName: "questionmark")
    pi.contentMode = .scaleAspectFit
    pi.clipsToBounds = true
    pi.tintColor = .systemPink
    return pi
  }()
  
  private let boloName: UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textColor = .label
    return label
  }()
  
  private let suggestedBudget: UILabel = {
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
  
  public func setBolo(with bolo: Bolo) {
    self.boloName.text = bolo.boloName
    self.suggestedBudget.text = bolo.suggestedBudget.description
    
    let url = URL(string: bolo.image[0])

    if let u = url, let imageData = try? Data(contentsOf: u) {
      self.boloImage.image = UIImage(data: imageData)
    }
  }
  
  // Setup UI
  private func setupUI() {
  
    self.contentView.addSubview(boloImage)
    self.contentView.addSubview(wrapTwoLabels)
    
    wrapTwoLabels.addSubview(boloName)
    wrapTwoLabels.addSubview(suggestedBudget)
    
    boloImage.translatesAutoresizingMaskIntoConstraints = false
    boloName.translatesAutoresizingMaskIntoConstraints = false
    suggestedBudget.translatesAutoresizingMaskIntoConstraints = false
    wrapTwoLabels.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
      
      boloImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
      boloImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
      boloImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
      boloImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6),
     
      wrapTwoLabels.topAnchor.constraint(equalTo: boloImage.bottomAnchor),
      wrapTwoLabels.leadingAnchor.constraint(equalTo: boloImage.leadingAnchor),
      wrapTwoLabels.trailingAnchor.constraint(equalTo: boloImage.trailingAnchor),
      
      boloName.leadingAnchor.constraint(equalTo: wrapTwoLabels.leadingAnchor),
      boloName.widthAnchor.constraint(equalTo: wrapTwoLabels.widthAnchor, multiplier: 0.5),
      
      suggestedBudget.trailingAnchor.constraint(equalTo: boloImage.trailingAnchor)
      
      ])
  }
  
}
