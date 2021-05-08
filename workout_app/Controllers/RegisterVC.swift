//
//  RegisterVC.swift
//  workout_app
//
//  Created by Denis Feier on 07.05.2021.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let register = RegisterView()
        register.delegate = self
        addView(register)
    }
    
}

extension RegisterVC: RegisterProtocol {
    
    func registerTapped(email: String, password: String, rePassword: String, terms: Bool) {
        
    }
    
}
