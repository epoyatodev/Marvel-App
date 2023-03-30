//
//  HerosView.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import SwiftUI

struct HerosView: View {
    
    @StateObject var viewModel: HeroViewModel
    @State private var filter = ""
    
    var body: some View {
      
        NavigationStack{

            List{
                if let heros = viewModel.heros?.data.results {
                    ForEach(heros) { hero in
                        NavigationLink{
                            HeroDetailView(viewModel: SeriesHeroViewModel(id: hero.id), hero: hero)
                        }label: {
                            HerosViewRow(hero: hero)
                            
                        }
                        
                    }
                    
                }
   
   
            }
            .id(0)
            .searchable(text: $filter, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar heroe")
            .onChange(of: filter) { newValue in
                viewModel.getHeros(filter: newValue)
            }
            .navigationTitle("Marvel")


            
        }
        
    }
}

struct HerosView_Previews: PreviewProvider {
    static var previews: some View {
        HerosView(viewModel: HeroViewModel(testing: false))
    }
}
