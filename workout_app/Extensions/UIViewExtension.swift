//
//  UIViewExtension.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviewWithContraints(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
    }
    
}
