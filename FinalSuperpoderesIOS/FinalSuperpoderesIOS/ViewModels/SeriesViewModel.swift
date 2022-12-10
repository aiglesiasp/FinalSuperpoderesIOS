//
//  SeriesViewModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    
    @Published var series: [Series]?
    @Published var status = Status.login
    
    private var suscriptor = Set<AnyCancellable>()
    
    //INIT CON TESTING
    init(testing: Bool = false) {
        if(testing) {
            getSeriesTesting()
        } else {
            getSeries()
        }
    }
    
    //MARK: FUNCIO PARA LLAMAR A LAS SERIES
    func getSeries() {
        
    }
    
    //MARK: FUNCION PARA DISEÑO/TESTING
    func getSeriesTesting() {
        //Crear array de SERIES
        let serie1 = Series(id: 1, available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "https://www.covercaratulas.com/ode/mini/divx-35156-a.jpg", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015)")], returned: 8)
        
        let serie2 = Series(id: 2, available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "http://gateway.marvel.com/v1/public/series/20544", name: "PELICULA 2")], returned: 8)
        
        let serie3 = Series(id: 3, available: 8, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/series", items: [SeriesItem(resourceURI: "http://gateway.marvel.com/v1/public/series/20544", name: "PELICULA 3")], returned: 8)
        
        self.series = [serie1, serie2, serie3]
        self.status = .loaded
    }
}
