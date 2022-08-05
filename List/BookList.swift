//
//  BookList.swift
//  TestApp (iOS)
//
//  Created by Luke Williams on 6/17/22.
//

import SwiftUI

struct BookList: View {
    
    @EnvironmentObject var bookModelData: BookModelData
    
    @State private var showFavoritesOnly = false;
    
    @State private var filterGenre: String = "All";
    
    @State private var isLoaded = false;
    
    var filteredFavorites: [BookModel] {
        bookModelData.books.filter {
            book in (!showFavoritesOnly || book.isFavorite)
        }
    }
    
    var filteredGenres: [BookModel] {
        if filterGenre != "All" {
            return filteredFavorites.filter {
                book in (book.category.rawValue == filterGenre)
            }
        }
        return filteredFavorites
    }
    
    var body: some View {
        List {
            HStack {
                Picker("Genre", selection: $filterGenre){
                    ForEach(Profile.Genre.allCases) {
                        genre in
                        Text(genre.rawValue).tag(genre)
                    }
                }
                Toggle(isOn: $showFavoritesOnly){
                    
                }
            }
            .onAppear() {
                if isLoaded == false {
                    self.filterGenre = bookModelData.profile.preferredGenre
                    self.isLoaded = true;
                }
                
            }
            
            ForEach(filteredGenres) { book in
                NavigationLink {
                    BookDetails(book: book)
                } label: {
                    BookRow(book: book)
                }
            }
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList().environmentObject(BookModelData())
    }
}
