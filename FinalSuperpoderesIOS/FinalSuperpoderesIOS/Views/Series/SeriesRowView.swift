//
//  SeriesRowView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct SeriesRowView: View {
    var serie: Serie
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "\(serie.thumbnail.path)/landscape_small.\(serie.thumbnail.thumbnailExtension)")) {image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(1)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(1)
            }
            .id(1)
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
                        .id(2)
                    
                    Text("\(serie.title)")
                        .padding(.bottom, 10)
                        .font(.caption)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .bold()
                        .id(3)
                }
            }
            .padding(.bottom, 10)
        }
    }
    }


struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(serie: Serie(id: 20815,
                                   title: "Howling Commandos of S.H.I.E.L.D. (2015 - 2016)",
                                   description: "",
                                   thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/b0/5d93a767070ed", thumbnailExtension: "jpg")))
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/330.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/))
    }
}
