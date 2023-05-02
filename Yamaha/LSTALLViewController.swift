//
//  LSTALLViewController.swift
//  Yamaha
//
//  Created by SmartVenture on 5/1/23.
//

import Foundation
import UIKit

class LSTALLViewController: UIViewController {
  
  let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome to the LSTALL Page!"
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textColor = .black
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(welcomeLabel)
    
    NSLayoutConstraint.activate([
      welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
