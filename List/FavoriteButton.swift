//
//  FavoriteButton.swift
//  Bookstore
//
//  Created by Luke Williams on 7/1/22.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Favorite", systemImage: isSet ? "star.fill":"star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .black)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
