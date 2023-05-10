//
//  HomePageViewController.swift
//  Yamaha
//
//  Created by SmartVenture on 5/1/23.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Products"
    let tabBarController = UITabBarController()
    
    let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action:  #selector(logout))
    
    navigationItem.rightBarButtonItem = logoutButton

    let productsVC = ProductsController()
    let lstallVC = LSTALLViewController()
    let boloVC = BOLOViewController()

    productsVC.title = "Products"
    lstallVC.title = "LSTALL"
    boloVC.title = "BOLO"

    tabBarController.setViewControllers([productsVC, lstallVC, boloVC], animated: false)
    tabBarController.delegate = self
    
    addChild(tabBarController)
    view.addSubview(tabBarController.view)
    tabBarController.didMove(toParent: self)
  }
  
  @objc func logout() {
    
    dismiss(animated: true) {
      let vc = LoginViewController()
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true, completion: nil)
    }
  }
}

extension HomePageViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    self.title = viewController.title
  }
}
