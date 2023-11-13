//
//  HomeViewModel.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

protocol HomeViewModelProtocol {
    // MARK: - States

    // MARK: - Functions

    // MARK: - Variables
}

class HomeViewModel: HomeViewModelProtocol {
    let service: HomeServiceProtocol

    init(service: HomeServiceProtocol) {
        self.service = service
    }
}
