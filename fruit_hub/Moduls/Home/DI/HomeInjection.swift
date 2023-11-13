//
//  HomeInjection.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

class HomeInjection: NSObject {
    static func provideService() -> HomeServiceProtocol {
        return HomeService()
    }
    
    static func provideHomeViewModel() -> HomeViewModelProtocol {
        return HomeViewModel(service: provideService())
    }
}
