//
//  ModelData.swift
//  TestApp (iOS)
//
//  Created by Luke Williams on 6/17/22.
//

import Foundation

final class BookModelData: ObservableObject {
    @Published var books: [BookModel] = loadFile("BookData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [BookModel]] {
        Dictionary(
            grouping: books,
            by: { $0.category.rawValue}
        )
    }
}



//unlike in Java, in C based languages functions can be defined outside of classes
//underscore means 'empty label'
// '->' means return value is T, or generic type
func loadFile<T: Decodable>(_ filename: String) -> T {
    //let means constant, not to be confused with javascript
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Can't find file")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Can't read file")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Can't read JSON")
    }
    
}
