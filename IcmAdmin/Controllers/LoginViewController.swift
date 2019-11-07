//
//  LoginViewController.swift
//  IcmAdmin
//
//  Created by mehdi jung on 30/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation
import UIKit


class LoginViewcontroller: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let alertService = AlertService()
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.keyboardDismissMode = .onDrag
        
    }
    
    @IBAction func didTapLoginButton() {
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
        else { return }
        
        let parameters = ["username": username,
                          "password": password]
        
        networkingService.request(endpoint: "/users/login", parameters: parameters) { (result) in
            print(result)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBarVC = segue.destination as? TabBarController, let user = sender as? User {
            tabBarVC.user = user
        }
    }

}
