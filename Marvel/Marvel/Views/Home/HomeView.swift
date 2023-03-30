//
//  HomeView.swift
//  KCHerosMulti
//
//  Created by Enrique Poyato Ortiz on 24/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var rootViewModel: HeroViewModel
    var body: some View {
        TabView {
            HerosView(viewModel: HeroViewModel())
                .tabItem {
                    Image(systemName: "house")
                    Text("Heroes")
                }

      
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(HeroViewModel())
    }
}
