//
//  LoaderView.swift
//  KCHerosMulti
//
//  Created by Enrique Poyato Ortiz on 23/3/23.
//

import SwiftUI

struct LoaderView: View {
    @State private var animationAmount = 0.5
    @State private var animate = false
    var body: some View {
        VStack{
            Image(decorative: "capitan-america")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(animationAmount)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
                .onAppear{
                    animationAmount = 1
                }
                .id(0)
            
            Text("Cargando...")
                .font(.title)
                .foregroundColor(.red)
                .padding(.top, 100)
                .id(1)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
