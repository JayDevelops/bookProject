//
//  Week3BookModel.swift
//  TestApp (iOS)
//
//  Created by Luke Williams on 6/17/22.
//

import Foundation
import SwiftUI


struct BookModel: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var authorName: String
    var price: String
    var description: String
    var isFavorite: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case all = "All"
        case novel = "Novel"
        case education = "Education"
        case cooking = "Cooking"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

}
