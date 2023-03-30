//
//  HeroDetailView.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import SwiftUI

struct HeroDetailView: View {
    @StateObject var viewModel: SeriesHeroViewModel
    var hero: Hero
    
    var body: some View {
        NavigationStack{
            List{
                if let series = viewModel.series?.data.results {
                    ForEach(series) { serie in
                        SeriesHeroRow(serie: serie)
                        
                        
                    }
                }
            }
            .navigationBarTitle("Series \(hero.name) \(hero.id)", displayMode: .inline)
        }
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView(viewModel: SeriesHeroViewModel(testing: true, id: 1), hero: Hero(id: 1, name: "Goku", description: "Prueba", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")]))
    }
}
