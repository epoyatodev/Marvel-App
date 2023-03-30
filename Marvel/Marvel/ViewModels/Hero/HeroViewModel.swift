//
//  HeroViewModel.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import Foundation
import Combine

final class HeroViewModel: ObservableObject {
    @Published var heros: MarvelHero?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()

    init(testing: Bool = false){
        if(testing){
            getHerosTesting()
        }else{
            getHeros(filter: "")
        }
    }
    
    func getHeros(filter: String){
        self.status = .loading
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionHeros(filter: filter))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelHero.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error Buscando los heroes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.heros = data
            }
            .store(in: &suscriptors)
            

    }
    
    func getHerosTesting(){
     
        
    }
}
