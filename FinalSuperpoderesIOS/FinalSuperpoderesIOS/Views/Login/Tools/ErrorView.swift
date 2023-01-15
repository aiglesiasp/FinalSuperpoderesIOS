//
//  ErrorView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject private var rootviewModel: RootViewModel
    private var errorString: String
    
    init(errorString: String) {
        self.errorString = errorString
    }
    
    var body: some View {
        ZStack {
            //MARK: Imagen FONDO
            //Imagen de FONDO Marvel
            Image(decorative: "marvelFondo")
                .resizable()
                .opacity(1)
                .id(1)
            //Imagen de FONDO Negra
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.3)
                .id(2)
            
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
                    .id(3)
                Spacer()
                    .id(7)
                Text(errorString)
                    .font(.title3)
                    .background(.red)
                    .frame(height: 30)
                    .foregroundColor(.black)
                    .bold()
                    .id(4)
                //BOTON PARA ENTRAR
                Button {
                    //volver login
                    rootviewModel.status = .login
                }label:
                {
                    Text("VOLVER LOGIN")
                        .padding()
                        .font(.custom("", size: 30))
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.white.opacity(0.9))
                        .cornerRadius(20)
                        .shadow(radius: 1.0, x:10, y:10)
                        .id(6)
                }
                .id(5)
                Spacer()
                    .id(8)
            }
        }
        .ignoresSafeArea()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorString: "PRUEBA DE ERROR")
    }
}
