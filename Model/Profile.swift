//
//  Profile.swift
//  Bookstore
//
//  Created by Luke Williams on 7/26/22.
//

import Foundation


struct Profile {
    
    var username: String
    var prefersNotifications = true
    var preferredGenre: String = "Novel"
    var updateDate = Date()
    
    static let `default` = Profile(username: "Luke")
    
    enum Genre: String, CaseIterable, Identifiable {
        case all = "All"
        case novel = "Novel"
        case education = "Education"
        case cooking = "Cooking"
        
        var id: String { rawValue }
    }
    
}

