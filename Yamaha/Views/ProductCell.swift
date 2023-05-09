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
//  private(set) var product: Product!
  private(set) var model: Model!
  
  
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
  
  private let imageView: UIImageView = {
    let pi = UIImageView()
    pi.image = UIImage(systemName: "questionmark")
    pi.contentMode = .scaleAspectFit
    pi.clipsToBounds = true
    pi.tintColor = .systemPink
    return pi
  }()
  
  
  let productName: UILabel = {
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
  
  
  
//  public func configure(withItem item: IList) {
//    self.productName.text = item.i_name
//    self.productPrice.text = item.i_price.description
//    
//    
//    }

  
  public func configure(with model: ProductResponse) {
    
    let formattedPrice = String(format: "%.2f", model.productPrice.retailPrice)
    self.productName.text = model.name
    self.productPrice.text = formattedPrice
    let url = URL(string: model.imageUrls[0])
    print("PICTURE: \(model.imageUrls[0])")
    
    let imageData = try? Data(contentsOf: url!)
        if let imageData = imageData {
            self.imageView.image = UIImage(data: imageData)
        }
    

//  public func configure(with model: Any) {
//    if let product = model as? Product {
//      self.productName.text = product.name.description
//      self.productPrice.text = product.price.description
//    } else if let lstAll = model as? LstAll {
//      self.productName.text = lstAll.lstAllName.description
//      self.productPrice.text = lstAll.lstAllPrice.description
//    } else if let bolo = model as? Bolo {
//      self.productName.text = bolo.boloName.description
//      self.productPrice.text = bolo.boloPrice.description
//    } else if let result = model as? Model {
//      print("Result2: ")
//      self.productName.text = result.title
//      self.productPrice.text = result.id.description
//    } else {
//      fatalError("Invalid model type")
//    }
//    self.product = product
//
//    self.productName.text = product.name.description
//    self.productPrice.text = product.price.description
  }
  
  // Setup UI
  private func setupUI() {
  
    self.contentView.addSubview(imageView)
    self.contentView.addSubview(wrapTwoLabels)
    
    wrapTwoLabels.addSubview(productName)
    wrapTwoLabels.addSubview(productPrice)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    productName.translatesAutoresizingMaskIntoConstraints = false
    productPrice.translatesAutoresizingMaskIntoConstraints = false
    wrapTwoLabels.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
      
      imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
      imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
      imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
      imageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6),
     
      wrapTwoLabels.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      wrapTwoLabels.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
      wrapTwoLabels.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
      
      productName.leadingAnchor.constraint(equalTo: wrapTwoLabels.leadingAnchor),
      productName.widthAnchor.constraint(equalTo: wrapTwoLabels.widthAnchor, multiplier: 0.5),
      
      productPrice.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
      

      
        ])
  }
  
  
}
