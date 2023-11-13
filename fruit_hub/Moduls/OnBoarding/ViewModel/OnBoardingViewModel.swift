//
//  OnBoardingViewModel.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

protocol OnBoardingViewModelProtocol {
    // MARK: - States

    // MARK: - Functions

    // MARK: - Variables
}

class OnBoardingViewModel: OnBoardingViewModelProtocol {
    let service: OnBoardingServiceProtocol

    init(service: OnBoardingServiceProtocol) {
        self.service = service
    }
}
