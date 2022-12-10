//
//  LoadingView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            //MARK: Imagen FONDO
            //Imagen de FONDO Marvel
            Image(decorative: "marvelFondo")
                .resizable()
                .opacity(1)
            //Imagen de FONDO Negra
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.3)
            
            //MARK: TITULO
            //TEXTO
            VStack {
                //TITULO
                Image(decorative: "marvelTitle")
                    .resizable()
                    .scaledToFit() //escalar
                    .frame(width: 300)
                    .opacity(0.4)
                    .padding(.top, 150)
                Spacer()
                
                Spacer()
                Text("LOADING...")
                    .font(.title3)
                    .background(.red)
                    .frame(height: 30)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
