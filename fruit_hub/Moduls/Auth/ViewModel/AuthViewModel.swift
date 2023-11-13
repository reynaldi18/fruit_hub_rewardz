//
//  AuthViewModel.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

protocol AuthViewModelProtocol {
    // MARK: - States

    // MARK: - Functions

    // MARK: - Variables
}

class AuthViewModel: AuthViewModelProtocol {
    let service: AuthServiceProtocol

    init(service: AuthServiceProtocol) {
        self.service = service
    }
}
