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
  private(set) var displayedProduct: Product!
  private(set) var displayedLstAll: LstAll!
  private(set) var displayedBolo: Bolo!
  
  
  // UI Components
  
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
  
  public func setProduct(with product: Product) {
    
    let formattedPrice = String(format: "%.2f", product.price.retailPrice)
    self.productName.text = product.name
    self.productPrice.text = formattedPrice
    let url = URL(string: product.image[0])

    let imageData = try? Data(contentsOf: url!)
        if let imageData = imageData {
          self.productImage.image = UIImage(data: imageData)
        }
  }
  
  public func setLstAll(with lstAll: LstAll) {
    
  }
  
  public func setBolo(with bolo: Bolo) {
    
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

        ])
  }
  
  
}
