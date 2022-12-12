//
//  SeriesDetailView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 12/12/22.
//

import SwiftUI

struct SeriesDetailView: View {
    var serie: Serie
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "\(serie.thumbnail.path)/portrait_xlarge.\(serie.thumbnail.thumbnailExtension)")) {image in
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
            
            VStack {
                //TITULO
                ZStack {
                    Image(decorative: "")
                        .resizable()
                        .background(.black)
                        .frame(height: 50)
                        .opacity(1)
                        .cornerRadius(10)
                    
                    Text("\(serie.title)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .bold()
                }
                
                Spacer()
                //DESCRIPCION
                ZStack {
                    Image(decorative: "")
                        .resizable()
                        .background(.black)
                        .frame(height: 200)
                        .opacity(0.7)
                        .cornerRadius(10)
                    
                    if let description = serie.description {
                        Text("\(description)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .bold()
                        
                    }
                    
                }
                    
                }
                
            }
        }
    }

struct SeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesDetailView(serie: Serie(id: 20815,
                                      title: "Howling Commandos of S.H.I.E.L.D. (2015 - 2016)",
                                      description: "Es una pelicula de hace muchos años, visto en mucho cines. Se esntreno en 2015. Muy chula",
                                      thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/b0/5d93a767070ed", thumbnailExtension: "jpg")))
    }
}
