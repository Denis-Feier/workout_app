//
//  ViewController.swift
//  workout_app
//
//  Created by Denis Feier on 06.05.2021.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginView = LoginView()
        loginView.delegate = self
//        loginView.did
        addView(loginView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}

extension LoginVC: LoginProtocol {
    
    func loginTapped(email: String, password: String) {
        print("Login")
        login(email: email, password: password)
    }
    
    func login(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                strongSelf.showAlert(message: "Credentials not ok or server error")
                return
            }
            
            result?.user.getIDToken(completion: { token, err in
                guard err == nil else {
                    strongSelf.showAlert(message: "Error getting token")
                    return
                }
                AppSettings.shared.token = token
                strongSelf.goToHome()
            })
            
        }
    }
    
    func goToHome() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        let navigation = UINavigationController(rootViewController: ViewPresenter.shared.getHomeVC())
        
        window.rootViewController = navigation

        let options: UIView.AnimationOptions = .transitionCrossDissolve

        let duration: TimeInterval = 0.3

        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            
        })
        
    }
    
    func goToRegister() {
        let registerVC = RegisterVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}
