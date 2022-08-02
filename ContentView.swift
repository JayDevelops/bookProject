//
//  ContentView.swift
//  Bookstore
//
//  Created by Luke Williams on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    @State private var showingProfile = false
    @EnvironmentObject var bookModelData: BookModelData
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        
        NavigationView {
            TabView {
                CategoryHome()
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)
                BookList()
                    .tabItem {
                        Label("Book List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("G6 Book Store").font(.title).bold()
                }
                ToolbarItem(){
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(bookModelData)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BookModelData())
    }
}
