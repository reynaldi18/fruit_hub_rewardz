//
//  OnBoardingInjection.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

class OnBoardingInjection: NSObject {
    static func provideService() -> OnBoardingServiceProtocol {
        return OnBoardingService()
    }
    
    static func provideOnBoardingViewModel() -> OnBoardingViewModelProtocol {
        return OnBoardingViewModel(service: provideService())
    }
}
