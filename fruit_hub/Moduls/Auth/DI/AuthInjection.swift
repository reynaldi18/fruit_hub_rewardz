//
//  AuthInjection.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

class AuthInjection: NSObject {
    static func provideService() -> AuthServiceProtocol {
        return AuthService()
    }
    
    static func provideAuthViewModel() -> AuthViewModelProtocol {
        return AuthViewModel(service: provideService())
    }
}
