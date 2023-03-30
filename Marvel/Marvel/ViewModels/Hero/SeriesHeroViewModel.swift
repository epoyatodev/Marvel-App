//
//  SeriesHeroViewModel.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import Foundation
import Combine

final class SeriesHeroViewModel: ObservableObject {
    @Published var series: MarvelSeriesModel?
    @Published var status = Status.none
    
    
    
    var suscriptors = Set<AnyCancellable>()

    public init(testing: Bool = false, id: Int){
        
        if(testing){
            
        }else{
            getHerosSeries(id: id)
        }
    }
    
    func getHerosSeries(id: Int){
        self.status = .loading
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionHerosSeries(id: id ))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelSeriesModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error Buscando los heroes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.series = data
            }
            .store(in: &suscriptors)
            

    }
    
    func getHerosSeriesTesting(){
     
//        let serie1 = Series(id: 1, title: "Serie Test", description: "Descripcion Test", resourceURI: "", urls: [URLElement(type: .comiclink, url: "")], startYear: 1, endYear: 2, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: ""), creators: Creators(available: 1, collectionURI: "", items: [CreatorsItem(resourceURI: "", name: "", role: "")], returned: 1), characters: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: .cover)], returned: 1), comics: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), events: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), next: nil, previous: nil)
        
        
    }
}
