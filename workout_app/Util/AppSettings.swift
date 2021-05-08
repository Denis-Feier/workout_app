//
//  AppSettings.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation
import JWTDecode

class AppSettings {
    static var shared = AppSettings()
    var token: String? {
        didSet {
            UserDefaults.standard.setValue(token ?? "", forKey: "userToken")
        }
    }
    
    func hasToken() -> Bool {
        guard let tokenUD = UserDefaults.standard.value(forKey: "userToken") as? String, !tokenUD.isEmpty else {
            return false
        }
        
        self.token = tokenUD
        return true
    }
    
    func logout() {
        UserDefaults.standard.setValue("", forKey: "userToken")
    }

    func tokenIsValid() -> Bool {
        
        guard let tokenUD = token, !tokenUD.isEmpty else { return false }
        
        guard let decodedToken = try? decode(jwt: tokenUD) else { return false }
        
        guard let expirationDate = decodedToken.expiresAt else { return false }
        
        return expirationDate.timeIntervalSinceReferenceDate > Date.init().timeIntervalSinceReferenceDate
    }
    
    private init() {
        if let tokenUD = UserDefaults.standard.value(forKey: "userToken") as? String {
            self.token = tokenUD
        }
    }
    
    
}
