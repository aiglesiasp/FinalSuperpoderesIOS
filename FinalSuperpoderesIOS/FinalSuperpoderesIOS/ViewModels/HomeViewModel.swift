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
        print("Cambiado estado a Cargando")
        self.status = .loading
        print("INICIO DATATASK")
        URLSession.shared
            .dataTaskPublisher(for: NetworkHelper().getSessionHeroes())
            .tryMap {
                print("Entrando en el MAP")
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                }
                //devolvemos el datos
                print($0.data)
                return $0.data
            }
            .decode(type: HeroDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Entrando en el Completion")
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
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857", modified: "")
        let hero2 = Hero(id: 1011442,
                         name: "Hit-Monkey",
                         resultDescription: "",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1011442", modified: "")
        let hero3 = Hero(id: 1017833,
                         name: "Ghost Rider (Robbie Reyes)",
                         resultDescription: "",
                         thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/10/622795c13e687", thumbnailExtension: "jpg"),
                         resourceURI: "http://gateway.marvel.com/v1/public/characters/1017833", modified: "")
        
        self.heros = [hero1, hero2, hero3]
        //CAMBIAR ESTADO A CARGADO
        self.status = .loaded
    }
}
