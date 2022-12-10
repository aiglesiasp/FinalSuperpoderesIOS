//
//  HomeViewModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var heros: [Heros]?
    @Published var status = Status.login
    
    private var suscriptor = Set<AnyCancellable>()
    
    //INIT CON TESTING
    init(testing: Bool = false) {
        if(testing) {
            getHerosTesting()
        } else {
            getHeros()
        }
    }
    
    //MARK: FUNCIO PARA LLAMAR A LOS HEROES
    func getHeros() {
        //Combine
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkHelper().getSessionHeroes())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                //devolvemos el JSON
                return $0.data
            }
            .decode(type: [Heros].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = Status.loaded
                case .failure:
                    self.status = .error(error: "Error descargando heroes")
                }
            } receiveValue: { data in
                self.heros = data
                print("DATA: \(data)")
            }
            .store(in: &suscriptor)

    }
    
    
    
    
    
    
    
    //MARK: FUNCION PARA DISEÑO/TESTING
    func getHerosTesting() {
        //Crear array de HEROES
        let hero1 = Heros(id: 1017857,
                         name: "Peggy Carter (Captain Carter)",
                         resultDescription: "",
                         modified: "2022-05-03T11:41:04-0400",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857",
                         comics: Comics(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1")], returned: 16),
                         series: Series(available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "http://gateway.marvel.com/v1/public/series/20544", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015)")], returned: 8),
                         stories: Stories(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/89913", name: "Captain America and the First Thirteen (2011) #1", type: "cover")], returned: 16),
                         events: Events(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/events", items: [], returned: 0),
                         urls:[URLElement(type: "detail", url: "http://marvel.com/characters/3503/peggy_carter?utm_campaign=apiRef&utm_source=cfa84e8f63e43679a5f9299c92a964a7")])
        let hero2 = Heros(id: 1017858,
                         name: "SPIDERMAN",
                         resultDescription: "",
                         modified: "2022-05-03T11:41:04-0400",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857",
                         comics: Comics(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1")], returned: 16),
                         series: Series(available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "http://gateway.marvel.com/v1/public/series/20544", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015)")], returned: 8),
                         stories: Stories(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/89913", name: "Captain America and the First Thirteen (2011) #1", type: "cover")], returned: 16),
                         events: Events(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/events", items: [], returned: 0),
                         urls:[URLElement(type: "detail", url: "http://marvel.com/characters/3503/peggy_carter?utm_campaign=apiRef&utm_source=cfa84e8f63e43679a5f9299c92a964a7")])
        let hero3 = Heros(id: 1017859,
                         name: "HULK",
                         resultDescription: "",
                         modified: "2022-05-03T11:41:04-0400",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857",
                         comics: Comics(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1")], returned: 16),
                         series: Series(available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "http://gateway.marvel.com/v1/public/series/20544", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015)")], returned: 8),
                         stories: Stories(available: 16, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/89913", name: "Captain America and the First Thirteen (2011) #1", type: "cover")], returned: 16),
                         events: Events(available: 0, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/events", items: [], returned: 0),
                         urls:[URLElement(type: "detail", url: "http://marvel.com/characters/3503/peggy_carter?utm_campaign=apiRef&utm_source=cfa84e8f63e43679a5f9299c92a964a7")])
        
        self.heros = [hero1, hero2, hero3]
        //CAMBIAR ESTADO A CARGADO
        self.status = .loaded
    }
}
