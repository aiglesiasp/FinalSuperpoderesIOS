//
//  SeriesRowView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct SeriesRowView: View {
    var serie: Series
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: serie.items[0].resourceURI)) {image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(1)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(10)
                    .opacity(1)
            }
            .ignoresSafeArea()
            
            //TITULO
            VStack {
                Spacer()
                ZStack {
                    Image(decorative: "")
                        .resizable()
                        .background(.black)
                        .frame(height: 50)
                        .opacity(0.7)
                        .cornerRadius(10)
                    
                    Text("\(serie.items[0].name)")
                        .padding(.bottom, 10)
                        .font(.title3)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .bold()
                }
            }
            .padding(.bottom, 10)
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(serie: Series(id: 1, available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "https://www.covercaratulas.com/ode/mini/divx-35156-a.jpg", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015)")], returned: 8))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/330.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}
