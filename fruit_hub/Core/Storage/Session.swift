//
//  Session.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

final class Session {
    enum SessionKey: String {
        case name = "NAME_KEY"
    }
    
    static let shared = Session()
    
    var name: String? {
        get {
            return UserDefaults.standard.string(forKey: SessionKey.name.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: SessionKey.name.rawValue)
        }
    }
}
