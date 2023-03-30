//
//  ErrorView.swift
//  KCHerosMulti
//
//  Created by Enrique Poyato Ortiz on 23/3/23.
//

import SwiftUI

struct ErrorView: View {
    
    @EnvironmentObject var viewModel: HeroViewModel
    private var textError: String

    init(error: String){
        self.textError = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .padding()
                .id(0)
            
            Text("\(textError)")
                .foregroundColor(.red)
                .font(.title)
                .id(1)
            
            Spacer()
            Button {
                // Volver al login
                self.viewModel.status = .none
            } label: {
                Text("Volver")
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(.orange)
                    .font(.title2)
                    .cornerRadius(15)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    
            }
            .id(2)

        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Error de prueba").environmentObject(HeroViewModel())
    }
}
