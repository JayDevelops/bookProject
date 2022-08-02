//
//  BookstoreApp.swift
//  Bookstore
//
//  Created by Luke Williams on 6/23/22.
//

import SwiftUI

@main
struct BookstoreApp: App {
    
    @StateObject private var bookModelData = BookModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(bookModelData)
        }
    }
}
