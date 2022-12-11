//
//  SeriesViewModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    
    @Published var series: [Serie]?
    @Published var status = Status.login
    
    private var suscriptor = Set<AnyCancellable>()
    
    //INIT CON TESTING
    init(testing: Bool = false, heroId: Int) {
        if(testing) {
            getSeriesTesting()
        } else {
            getSeries(heroId: heroId)
        }
    }
    
    //MARK: FUNCION CANCELAR SUSCRIPTORES
    func cancelAll(){
        suscriptor.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
    
    //MARK: FUNCIO PARA LLAMAR A LAS SERIES
    func getSeries(heroId: Int) {
        cancelAll()
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkHelper().getSessionHeroesSeries(heroId: heroId))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error")
                    throw URLError(.badServerResponse)
                }
                //devolvemos el JSON
                return $0.data
            }
            .decode(type: SeriesDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = Status.loaded
                case .failure:
                    self.status = .error(error: "Error decargando datos")
                }
            } receiveValue: { data in
                self.series = data.data.result
                print("DATA: \(data)")
            }
            .store(in: &suscriptor)

        
    }
    
    //MARK: FUNCION PARA DISEÑO/TESTING
    func getSeriesTesting() {
        //Crear array de SERIES
        let serie1 = Serie(id: 27700,
                           title: "Hit-Monkey By Daniel Way: Bullets & Bananas (2019)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"))
        let serie2 = Serie(id: 20815,
                           title: "Howling Commandos of S.H.I.E.L.D. (2015 - 2016)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/b0/5d93a767070ed", thumbnailExtension: "jpg"))
        let serie3 = Serie(id: 20617,
                           title: "Old Man Logan (2016 - 2018)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/20/58e6686c2a72f", thumbnailExtension: "jpg"))
        let serie4 = Serie(id: 23970,
                           title: "Deadpool by Daniel Way Omnibus Vol. 1 (2018)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"))
        
        self.series = [serie1, serie2, serie3, serie4]
        self.status = .loaded
    }
}
