//
//  UIViewControllerExtension.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addView(_ view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
