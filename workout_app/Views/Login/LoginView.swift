//
//  LoginView.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class LoginView: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    var delegate: LoginProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    func configureView() {
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubviewWithContraints(containerView)
        configureBtn()
        addPlaceholders()
    }
    
    func addPlaceholders() {
        emailField.placeholder = "Email"
        passwordField.placeholder = "Password"
    }
    
    func configureBtn() {
        loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signupBtn.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped() {
        delegate?.loginTapped(email: emailField.text ?? "", password: passwordField.text ?? "")
    }
    
    @objc func signupTapped() {
        delegate?.goToRegister()
    }
    
}
