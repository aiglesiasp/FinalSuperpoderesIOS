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
        let serie1 = Serie(id: 27700,
                           title: "Hit-Monkey By Daniel Way: Bullets & Bananas (2019)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg),
                           resourceURI: "")
        let serie2 = Serie(id: 20815,
                           title: "Howling Commandos of S.H.I.E.L.D. (2015 - 2016)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/b0/5d93a767070ed", thumbnailExtension: Extension.jpg),
                           resourceURI: "")
        let serie3 = Serie(id: 20617,
                           title: "Old Man Logan (2016 - 2018)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/20/58e6686c2a72f", thumbnailExtension: Extension.jpg),
                           resourceURI: "")
        let serie4 = Serie(id: 23970,
                           title: "Deadpool by Daniel Way Omnibus Vol. 1 (2018)",
                           description: "",
                           thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg),
                           resourceURI: "")
        
        self.series = [serie1, serie2, serie3, serie4]
        self.status = .loaded
    }
}
