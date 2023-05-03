//
//  ProductCell.swift
//  Yamaha
//
//  Created by SmartVenture on 5/2/23.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {
  
  static let identifier = "ProductCell"
  
  // Variables
  private(set) var product: Product!
  
  
  // UI Components
  
//  private let stackView: UIStackView = {
//    let sv = UIStackView()
//    sv.axis = .vertical
//    sv.spacing = 8
//    sv.alignment = .center
//    return sv
//  }()
  
  private let wrapTwoLabels: UIView = {
    let wtl = UIView()
    
    return wtl
  }()
  
  private let productImage: UIImageView = {
    let pi = UIImageView()
    pi.image = UIImage(systemName: "questionmark")
    pi.contentMode = .scaleAspectFit
    pi.clipsToBounds = true
    pi.tintColor = .systemPink
    return pi
  }()
  
  private let productName: UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textColor = .label
    return label
  }()
  
  private let productPrice: UILabel = {
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
  
  public func configure(with model: Any) {
    if let product = model as? Product {
      self.productName.text = product.name.description
      self.productPrice.text = product.price.description
    } else if let lstAll = model as? LstAll {
      self.productName.text = lstAll.lstAllName.description
      self.productPrice.text = lstAll.lstAllPrice.description
    } else if let bolo = model as? Bolo {
      self.productName.text = bolo.boloName.description
      self.productPrice.text = bolo.boloPrice.description
    } else {
      fatalError("Invalid model type")
    }
//    self.product = product
//
//    self.productName.text = product.name.description
//    self.productPrice.text = product.price.description
  }
  
  // Setup UI
  private func setupUI() {
  
    self.contentView.addSubview(productImage)
    self.contentView.addSubview(wrapTwoLabels)
    
    wrapTwoLabels.addSubview(productName)
    wrapTwoLabels.addSubview(productPrice)
    
    productImage.translatesAutoresizingMaskIntoConstraints = false
    productName.translatesAutoresizingMaskIntoConstraints = false
    productPrice.translatesAutoresizingMaskIntoConstraints = false
    wrapTwoLabels.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
      
      productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
      productImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
      productImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
      productImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6),
     
      wrapTwoLabels.topAnchor.constraint(equalTo: productImage.bottomAnchor),
      wrapTwoLabels.leadingAnchor.constraint(equalTo: productImage.leadingAnchor),
      wrapTwoLabels.trailingAnchor.constraint(equalTo: productImage.trailingAnchor),
      
      productName.leadingAnchor.constraint(equalTo: wrapTwoLabels.leadingAnchor, constant: 20),
      
      productPrice.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -20)

      
//      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
      
        ])
  }
  
  
}
