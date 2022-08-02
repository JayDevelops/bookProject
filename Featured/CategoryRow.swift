//
//  CategoryRow.swift
//  Bookstore
//
//  Created by Luke Williams on 7/21/22.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [BookModel]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(items) {book in
                        NavigationLink {
                            BookDetails(book: book)
                        } label : {
                            CategoryItem(book: book)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var books = BookModelData().books
    static var previews: some View {
        CategoryRow(categoryName: books[0].category.rawValue, items: Array(books.prefix(4)))
    }
}
