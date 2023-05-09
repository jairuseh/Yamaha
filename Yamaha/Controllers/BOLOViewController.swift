//
//  BOLOViewController.swift
//  Yamaha
//
//  Created by SmartVenture on 5/1/23.
//


import Foundation
import UIKit

class BOLOViewController: UIViewController {
  
  private let bolo: [Bolo] = Bolo.mockArrayBolo()
  
  // UI Components
//  let tableView: UITableView = {
//    let tv = UITableView()
//    tv.backgroundColor = .systemBackground
//    tv.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
//    return tv
//  }()
  
  let boloCollectionView: UICollectionView = {
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
    
    boloCollectionView.delegate = self
    boloCollectionView.dataSource = self
    
  }
  
  
  // Setup UI
  private func setupUI() {
    self.view.backgroundColor = .systemBackground
    let tabBarHeight: CGFloat = tabBarController!.tabBar.frame.height + 20
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
    navBar.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
    navBar.setItems([UINavigationItem(title: "Listings")], animated: false)
    
    self.view.addSubview(navBar)
    
    self.view.addSubview(boloCollectionView)
    self.boloCollectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.boloCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
      self.boloCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -tabBarHeight),
      self.boloCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      self.boloCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    ])
  }
}



extension BOLOViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.bolo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = boloCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
      fatalError("Unable to dequeue ProductCell")
    }
//    let bolo = self.bolo[indexPath.item]
//    cell.configure(with: bolo)


    return cell
  }
}
