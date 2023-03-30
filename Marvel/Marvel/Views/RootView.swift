//
//  RootView.swift
//  KCHerosMulti
//
//  Created by Enrique Poyato Ortiz on 23/3/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: HeroViewModel
    var body: some View {
        switch rootViewModel.status{
        case .none:
            Text("None")
        case .loaded:
            HomeView()
        case .error(error: let errorString):
            ErrorView(error: errorString)

        case .loading:
            LoaderView()

        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(HeroViewModel())
    }
}
