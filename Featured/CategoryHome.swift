//
//  CategoryHome.swift
//  Bookstore
//
//  Created by Luke Williams on 7/21/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var bookModelData: BookModelData
    //@State private var showingProfile = false
    var body: some View {
        VStack {
            List {
                ForEach(bookModelData.categories.keys.sorted(), id: \.self) { key in CategoryRow(categoryName: key, items: bookModelData.categories[key]!)
                    
                }
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(BookModelData())
    }
}
