//
//  RegisterView.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class RegisterView: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var checkmarkBtn: UIButton!
    @IBOutlet weak var checkmarkPicture: UIImageView!
    
    var termsAndConditions = false {
        didSet {
            if termsAndConditions {
                checkmarkPicture.image = UIImage(systemName: "checkmark.square")
            } else {
                checkmarkPicture.image = UIImage(systemName: "square")
            }
        }
    }
    
    var delegate: RegisterProtocol? 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        Bundle.main.loadNibNamed("RegisterView", owner: self, options: nil)
        addSubviewWithContraints(containerView)
        checkmarkPicture.image = UIImage(systemName: "square")
        addPlaceholders()
        configBtns()
    }
    
    func addPlaceholders() {
        emailField.placeholder = "Email"
        passwordField.placeholder = "Password"
        repasswordField.placeholder = "Re-Password"
    }
    
    func configBtns() {
        checkmarkBtn.addTarget(self, action: #selector(toggleCheckmark), for: .touchUpInside)
        registerBtn.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }
    
    @objc func toggleCheckmark() {
        termsAndConditions = !termsAndConditions
    }
    
    @objc func registerTapped() {
        delegate?.registerTapped(email: emailField.text ?? "", password: passwordField.text ?? "", rePassword: repasswordField.text ?? "", terms: termsAndConditions)
    }

}
