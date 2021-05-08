//
//  LoginProtocol.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation

protocol LoginProtocol {
    
    func loginTapped(email: String, password: String)
    func goToRegister()
}
