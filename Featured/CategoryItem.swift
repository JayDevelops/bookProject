//
//  CategoryItem.swift
//  Bookstore
//
//  Created by Luke Williams on 7/21/22.
//

import SwiftUI

struct CategoryItem: View {
    
    var book: BookModel
    
    var body: some View {
        VStack {
            book.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(book.name)
        }
        
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(book: BookModelData().books[0])
    }
}
