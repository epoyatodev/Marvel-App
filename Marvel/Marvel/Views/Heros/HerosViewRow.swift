//
//  HerosViewRow.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import SwiftUI

struct HerosViewRow: View {
    @Environment(\.colorScheme) var colorScheme

    var hero: Hero
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .opacity(0.7)
                    .shadow(radius: 10, x: 10, y: 20)
                    .id(0)
                    .background(LinearGradient(gradient: Gradient(colors: colorScheme == .light ? [.white, .white, .black, .white, .white] : [.black]), startPoint: .top, endPoint: .bottom))
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .shadow(radius: 10, x: 10, y: 20)
                    .id(1)
                
                
            }
            
            Text(hero.name)
                .font(.title)
                .foregroundColor(colorScheme == .dark ? .white : .purple)
                .bold()
                .opacity(0.9)
                .shadow(radius: 10, x: 10, y: 5)
                .id(2)
            
                

        }
        
        
    }
}

struct HerosViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HerosViewRow(hero: Hero(id: 1, name: "Goku", description: "Prueba", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")]))
    }
}
