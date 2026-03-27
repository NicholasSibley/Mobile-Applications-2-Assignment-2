import SwiftUI

struct FavoritesView: View {

    @EnvironmentObject var favorites: FavoritesViewModel

    var favoritedCities:  [CityModel]  { favorites.cities.filter  { $0.isFavorite } }
    var favoritedHobbies: [HobbyModel] { favorites.hobbies.filter { $0.isFavorite } }
    var favoritedBooks:   [BookModel]  { favorites.books.filter   { $0.isFavorite } }

    var isEmpty: Bool {
        favoritedCities.isEmpty && favoritedHobbies.isEmpty && favoritedBooks.isEmpty
    }

    var body: some View {
        NavigationStack {
            Group {
                if isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 50))
                            .foregroundStyle(.secondary)
                        Text("No favorites yet")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        if !favoritedCities.isEmpty {
                            Section(header: Text("Cities")) {
                                ForEach(favoritedCities) { city in
                                    CityCardView(city: city)
                                        .listRowInsets(EdgeInsets())
                                }
                            }
                        }

                        if !favoritedHobbies.isEmpty {
                            Section(header: Text("Hobbies")) {
                                ForEach(favoritedHobbies) { hobby in
                                    HobbyRowView(hobby: hobby)
                                }
                            }
                        }

                        if !favoritedBooks.isEmpty {
                            Section(header: Text("Books")) {
                                ForEach(favoritedBooks) { book in
                                    BookRowView(book: book)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
