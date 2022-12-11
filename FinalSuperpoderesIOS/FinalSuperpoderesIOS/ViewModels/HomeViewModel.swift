//
//  HomeViewModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var heros: [Hero]?
    @Published var status = Status.login
    
    private var suscriptor = Set<AnyCancellable>()
    
    //INIT CON TESTING
    init(testing: Bool = false) {
        print("INICIO CLASE HOMEVIEWMODEL")
        if(testing) {
            print("Clase Testing HomeViewModel")
            getHerosTesting()
        } else {
            print("IClase GETHEROS RED HomeViewModel")
            getHeros()
        }
    }
    
    //MARK: FUNCION CANCELAR SUSCRIPTORES
    func cancelAll(){
        print("Cancelo Suscriptor")
        suscriptor.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
    
    //MARK: FUNCIO PARA LLAMAR A LOS HEROES
    func getHeros() {
        cancelAll()
        //Combine
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkHelper().getSessionHeroes())
            .tryMap {
                print("Entrando en el MAP")
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                }
                //devolvemos el JSON
                print($0.data)
                return $0.data
            }
            .decode(type: HeroWelcome.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finalizado okey")
                    self.status = Status.loaded
                case .failure:
                    print("Finalizado CON ERROR")
                    self.status = .error(error: "Error decargando datos")
                }
            } receiveValue: { data in
                print("DATA: \(data)")
                self.heros = data.data.result
            }
            .store(in: &suscriptor)

    }
    
    
    
    
    
    
    
    //MARK: FUNCION PARA DISEÑO/TESTING
    func getHerosTesting() {
        //Crear array de HEROES
        let hero1 = Hero(id: 1017857,
                         name: "Peggy Carter (Captain Carter)",
                         resultDescription: "",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857")
        let hero2 = Hero(id: 1011442,
                         name: "Hit-Monkey",
                         resultDescription: "",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: Extension.jpg),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1011442")
        let hero3 = Hero(id: 1017833,
                         name: "Ghost Rider (Robbie Reyes)",
                         resultDescription: "",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/10/622795c13e687", thumbnailExtension: Extension.jpg),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017833")
        
        self.heros = [hero1, hero2, hero3]
        //CAMBIAR ESTADO A CARGADO
        self.status = .loaded
    }
}
