//
//  BooksView.swift
//  Favorites_Completed
//
//  Created by user294942 on 3/24/26.
//

import SwiftUI

struct BooksView: View {

    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.filteredBooks(searchText: searchText)) { book in
                    BookRowView(book: book)
                }
            }
            .padding()
        }
    }
}

#Preview {
    BooksView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
