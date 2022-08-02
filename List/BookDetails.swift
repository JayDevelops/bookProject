//
//  BookDetails.swift
//  Bookstore
//
//  Created by Luke Williams on 6/24/22.
//

import SwiftUI

struct BookDetails: View {
    
    @EnvironmentObject var bookModelData: BookModelData
    var book: BookModel
    
    var bookIndex: Int {
        bookModelData.books.firstIndex(where: {$0.id == book.id})!
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                book.image.resizable().frame(width:200, height:200)
                HStack() {
                    FavoriteButton(isSet: $bookModelData.books[bookIndex].isFavorite)
                    VStack(alignment: .leading) {
                        Text(book.name).font(.system(size: 20))
                        Text("By \(book.authorName)")
                        
                    }
                    Spacer()
                    Text(book.price)
                }
                Text(book.description)
            }.padding()
        }
        .navigationTitle(book.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookDetails_Previews: PreviewProvider {
    
    static let bookModelData = BookModelData()
    static var previews: some View {
        BookDetails(book: bookModelData.books[0]).environmentObject(bookModelData)
    }
}
