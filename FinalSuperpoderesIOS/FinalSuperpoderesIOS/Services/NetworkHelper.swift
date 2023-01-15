//
//  NetworkHelper.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation

//Creo el servidor
let server = "https://gateway.marvel.com"

//Creo metodos
struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

//Endpoints
enum Endpoints: String {
    case heroesList = "/v1/public/characters"
    case series = "/series"
    case comics = "/comics"
}

//TODO: Parametros de entrada
enum ParametrosEntrada: String {
    case apikey = "cfa84e8f63e43679a5f9299c92a964a7"
    case ts = "1"
    case hash = "6ee3533574aa152e469b939894ec2f49"
}


//MARK: NETWORK HELPER
struct NetworkHelper {
    
    
    //MARK: FUNCION CAPTURAR HEROES
    func getSessionHeroes() -> URLRequest {
        let url = URL (string:"https://gateway.marvel.com/v1/public/characters?apikey=cfa84e8f63e43679a5f9299c92a964a7&ts=1&hash=6ee3533574aa152e469b939894ec2f49&orderBy=-modified")
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        //request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        return request
    }
    
    //MARK: FUNCION CAPTURAR SERIES
    func getSessionHeroesSeries(heroId: Int) -> URLRequest{
            //Create url with need it parameters
        let url = URL(string: "\(server)\(Endpoints.heroesList.rawValue)/\(heroId)\(Endpoints.series.rawValue)?apikey=\(ParametrosEntrada.apikey.rawValue)&ts=\(ParametrosEntrada.ts.rawValue)&hash=\(ParametrosEntrada.hash.rawValue)&orderBy=-modified")
            //Create request from url
            var request = URLRequest(url: url!)
            request.httpMethod = HTTPMethods.get
            
            return request
        }
    
    
    //MARK: FUNCION CAPTURAR COMICS
    func getSessionHeroesComics(heroId: Int) -> URLRequest{
            //Create url with need it parameters
        let url = URL(string: "\(server)\(Endpoints.heroesList.rawValue)/\(heroId)\(Endpoints.comics.rawValue)?apikey=\(ParametrosEntrada.apikey.rawValue)&ts=\(ParametrosEntrada.ts.rawValue)&hash=\(ParametrosEntrada.hash.rawValue)&orderBy=-modified")
            //Create request from url
            var request = URLRequest(url: url!)
            request.httpMethod = HTTPMethods.get
            
            return request
        }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
