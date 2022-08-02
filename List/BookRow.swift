//
//  BookRow.swift
//  TestApp (iOS)
//
//  Created by Luke Williams on 6/17/22.
//

import SwiftUI

struct BookRow: View {
    
    var book: BookModel
    
    var body: some View {
        HStack {
            book.image.resizable().frame(width:100, height:100)
           Text(book.name)
            Spacer()
            
            if book.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
       }
        
    }
}

struct BookRow_Previews: PreviewProvider {
    
    static var books = BookModelData().books
    static var previews: some View {
        BookRow(book: books[1])
    }
}
