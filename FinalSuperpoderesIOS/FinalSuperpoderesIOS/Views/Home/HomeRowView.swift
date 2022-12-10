//
//  HomeRowView.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import SwiftUI

struct HomeRowView: View {
    var hero: Heros
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: hero.thumbnail.path)) {image in
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
        }
        
    }
}


//MARK: PREVISUALIZAR
struct HomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRowView(hero: Heros(id: 1017857,
                                name: "Peggy Carter (Captain Carter)",
                                resultDescription: "",
                                modified: "2022-05-03T11:41:04-0400",
                                thumbnail: Thumbnail(path: "https://i.pinimg.com/originals/2d/79/17/2d7917e11f4e9edd68d0014c9846f0aa.png", thumbnailExtension: "jpg"),
                                resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857",
                                comics: Comics(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1")], returned: 16),
                                series: Series(id: 1, available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "http://gateway.marvel.com/v1/public/series/20544", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015)")], returned: 8),
                                stories: Stories(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/89913", name: "Captain America and the First Thirteen (2011) #1", type: "cover")], returned: 16),
                                events: Events(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/events", items: [], returned: 0),
                                urls:[URLElement(type: "detail", url: "http://marvel.com/characters/3503/peggy_carter?utm_campaign=apiRef&utm_source=cfa84e8f63e43679a5f9299c92a964a7")]))
        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/330.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/))
    }
}
