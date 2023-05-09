//
//  ProductsController.swift
//  Yamaha
//
//  Created by SmartVenture on 5/1/23.
//

import Foundation
import UIKit

class ProductsController: UIViewController {
  
  // Variables
  private var products: [Product] = []
  
  // UI Components

  let productCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    let spacing: CGFloat = 10.0
    let width = UIScreen.main.bounds.width - (spacing * 3.0)
    layout.itemSize = CGSize(width: width / 2, height: 200)
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    return cv
  }()
  

  // Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupUI()
    
    productCollectionView.delegate = self
    productCollectionView.dataSource = self
    
  }
  
  
  // Setup UI
  private func setupUI() {
    self.view.backgroundColor = .systemBackground
    let tabBarHeight: CGFloat = tabBarController!.tabBar.frame.height + 20
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
    navBar.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
    navBar.setItems([UINavigationItem(title: "Listings")], animated: false)
    
    self.view.addSubview(navBar)
    
    self.view.addSubview(productCollectionView)
    self.productCollectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.productCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
      self.productCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -tabBarHeight),
      self.productCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      self.productCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    ])
  }
}

extension ProductsController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.products.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
      fatalError("Unable to dequeue ProductCell")
    }
    let product = self.products[indexPath.item]
    cell.configure(with: product
    )
    
    
    return cell
  }
  
}
