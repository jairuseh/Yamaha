//
//  ViewController.swift
//  Yamaha
//
//  Created by SmartVenture on 4/28/23.
//

import UIKit

class LoginScreenViewController: UIViewController {
  
  let container: UIView = {
    let container = UIView()
    container.backgroundColor = .white
    container.layer.cornerRadius = 20
    container.translatesAutoresizingMaskIntoConstraints = false
    return container
  }()
    
  let usernameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Email"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
    
  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
    
  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sing in with Email", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemPink
    button.layer.cornerRadius = 10
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    view.backgroundColor = .systemPink
      
      // Add subviews to the view
    container.addSubview(usernameTextField)
    container.addSubview(passwordTextField)
    container.addSubview(loginButton)
    view.addSubview(container)
      
      // Add constraints
    NSLayoutConstraint.activate([
      container.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
      container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      container.widthAnchor.constraint(equalTo: view.widthAnchor),
      container.heightAnchor.constraint(equalTo: view.heightAnchor),
        
      usernameTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
      usernameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
      usernameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
      usernameTextField.heightAnchor.constraint(equalToConstant: 55),
          
      passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
      passwordTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
      passwordTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
      passwordTextField.heightAnchor.constraint(equalToConstant: 55),
          
      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
      loginButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      loginButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
      loginButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
//    loginButton.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -20),
      loginButton.heightAnchor.constraint(equalToConstant: 55)
      
    ])
  }
  
}
