//
//  ViewController.swift
//  workout_app
//
//  Created by Denis Feier on 06.05.2021.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginView = LoginView()
        loginView.delegate = self
//        loginView.did
        addView(loginView)
        
    }

}

extension LoginVC: LoginProtocol {
    
    func loginTapped(email: String, password: String) {
        print("Login")
    }
    
    func goToRegister() {
        let registerVC = RegisterVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}
