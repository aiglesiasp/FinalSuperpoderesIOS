//
//  LoginView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI



struct LoginView: View {
    
    @EnvironmentObject private var rootviewModel: RootViewModel
    
    
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
                //TEXTO
                Image(decorative: "marvelTitle")
                    .resizable()
                    .scaledToFit() //escalar
                    .frame(width: 300)
                    .opacity(0.4)
                    .padding(.top, 150)
                Spacer()
                //BOTON PARA ENTRAR
                Button {
                    //TODO: Pasar a la vista de HOME
                    rootviewModel.loginTest()
                }label:
               
                {
                    Text("ENTRAR")
                        .padding()
                        .font(.custom("", size: 30))
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.white.opacity(0.9))
                        .cornerRadius(20)
                        .shadow(radius: 1.0, x:10, y:10)
                }
                Spacer()

                }
            }
        .ignoresSafeArea()
        
    }
}



//MARK: PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(RootViewModel())
    }
}
