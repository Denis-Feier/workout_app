//
//  RegisterProtocol.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation

protocol RegisterProtocol {
    func registerTapped(email: String, password: String, rePassword: String, terms: Bool)
}
