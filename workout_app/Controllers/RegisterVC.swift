//
//  RegisterVC.swift
//  workout_app
//
//  Created by Denis Feier on 07.05.2021.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let register = RegisterView()
        register.delegate = self
        addView(register)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
         
    }
    
}

extension RegisterVC: RegisterProtocol {
    
    func registerTapped(email: String, password: String, rePassword: String, terms: Bool) {
        if terms {
            tryRegister(email: email, password: password, rePassword: rePassword)
        } else {
            showAlert(message: "Terms and conditions not checked")
        }
    }
    
    func tryRegister(email: String, password: String, rePassword: String) {
        
        if !isValidEmail(email: email) {
            showAlert(message: "Email not valid")
            return
        }
        
        if password.count < 6 {
            showAlert(message: "Password must be at minimal length 4")
            return
        }
        
        if rePassword != password {
            showAlert(message: "Password and Re-Password don't match")
            return
        }
        
        if !isValidPassword(password: password) {
            showAlert(message: "Password not valid")
            return
        }
        
        register(email: email, password: password)
        
    }
    
    func register(email: String, password: String) {
        
        let spinner = SpinnerViewController.createSpinnerView(vc: self)
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            
            guard error == nil else {
                // Error at create user
                SpinnerViewController.dismissSpinnerView(spinner: spinner)
                strongSelf.showAlert(message: "Error creating user")
                return
            }
            
            result?.user.getIDToken(completion: { token, err in
                guard err == nil else {
                    SpinnerViewController.dismissSpinnerView(spinner: spinner)
                    strongSelf.showAlert(message: "Error getting token")
                    return
                }
                AppSettings.shared.token = token
                SpinnerViewController.dismissSpinnerView(spinner: spinner)
                strongSelf.goToHome()
            })
            
        }
    }
    
    func goToHome() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        window.rootViewController = UINavigationController(rootViewController: ViewPresenter.shared.getHomeVC())

        let options: UIView.AnimationOptions = .transitionCrossDissolve

        let duration: TimeInterval = 0.3

        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            
        })
        
    }
    
    func isValidEmail(email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
    }
    
    func isValidPassword(password: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9!@#$&()\\-`.+,/\"]*$", options: .caseInsensitive)
        return regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) != nil
    }
    
}
