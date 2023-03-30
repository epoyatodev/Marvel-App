//
//  SeriesHeroRow.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import SwiftUI

struct SeriesHeroRow: View {
    @Environment(\.colorScheme) var colorScheme

    var serie: Series
    var body: some View {
        VStack{
            
            Text(serie.title)
                .font(.title2)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding()
                .bold()
                .opacity(0.7)
                .id(0)
            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .shadow(radius: 10, x: 10, y: 20)
                    .padding()
                    .id(1)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .shadow(radius: 10, x: 10, y: 20)
                    .padding()
                    .id(2)


            }
            if let descripcion = serie.description {
                Text("\(descripcion)")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding()
                    .id(3)

                

            }else{
                Text("No description")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding()
                    .id(4)
            }
            
                
                

        }
        .background(LinearGradient(gradient: Gradient(colors: colorScheme == .light ? [.white, .white, .black, .white, .white] : [.black]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
    }
}

struct SeriesHeroRow_Previews: PreviewProvider {
    static var previews: some View {
        SeriesHeroRow(serie: Series(id: 1, title: "Serie Test", description: "Descripcion Test", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244")))
    }
}
