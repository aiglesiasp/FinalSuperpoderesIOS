//
//  HomeRowView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct HomeRowView: View {
    var hero: Hero
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "\(hero.thumbnail.path)/standard_large.\(hero.thumbnail.thumbnailExtension)")) {image in
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
                    
                    Text("\(hero.name)")
                        .padding(.bottom, 10)
                        .font(.title3)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .bold()
                }
            }
            .padding(.bottom, 10)
            .cornerRadius(20)
        }
        
    }
}


//MARK: PREVISUALIZAR
struct HomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRowView(hero: Hero(id: 1,
                               name: "Hit-Monkey",
                               resultDescription: "",
                               thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"),
                               resourceURI: "", modified: ""))
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/330.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}
