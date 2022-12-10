//
//  NetworkHelper.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//
let publicKey = "cfa84e8f63e43679a5f9299c92a964a7"
let privateKey = "eec98a5800df793ca31812187b3ae75e91597d9a"

import Foundation

//Creo el servidor
let server = "https://gateway.marvel.com"
let ts = "1"
let hash = "6ee3533574aa152e469b939894ec2f49"
let apiKey = "cfa84e8f63e43679a5f9299c92a964a7"

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
    //case seriesList = "/v1/public/characters/characterID/series"
}

//TODO: Parametros de entrada
enum ParametrosEntrada: String {
    case apikey = "apikey"
    case timestamp = "ts"
    case md5 = "hash"
}

struct Parametro {
    let nombreParametro: ParametrosEntrada
    let value: String
}

//MARK: NETWORK HELPER
struct NetworkHelper {
    
    
    //MARK: FUNCION PARA GENERARME URL MONTADAS
    private func createURLString(endpoint: String) -> String {
        let initialURL = server
        let endpointURL = initialURL + "\(endpoint)"
        let finalURL = endpointURL + "?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)"
        return finalURL
        
    }
    
    //MARK: FUNCION CAPTURAR HEROES
    func getSessionHeroes() -> URLRequest {
        var urlCad: String = createURLString(endpoint: Endpoints.heroesList.rawValue)
        urlCad = urlCad + "&orderBy=-modified"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        return request
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    //---------------------------------------------------------------------
    //PROFESOR
    private func getURLPrueba(endpoint:String, subPath:String = "") -> String{
        var url = server
        
        url += "\(endpoint)\(subPath)" //endpoint de la uRL. Subpath solo es para series.
        url += "?apikey=\(apiKey)"
        url += "&ts=\(ts)"
        url += "&hash=\(hash)"
        return url
    }
    
    func getSessionMarvelCharactersPrueba() -> URLRequest {
        var urlCad : String = getURLPrueba(endpoint: Endpoints.heroesList.rawValue)
        urlCad += "&orderBy=-modified"  //para ordenacion descendente , asi se ven los ultimos superheroes
        
        // creamos el request
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //Header aplication JSON
        return request
    }
    
    func getSessionMarvelSeriesPrueba(idHero:Int) -> URLRequest {
        var urlCad : String = getURLPrueba(endpoint: Endpoints.heroesList.rawValue,subPath: "/\(idHero)/series")
        urlCad += "&orderBy=-modified"  //para ordenacion descendente , asi se ven los ultimos series
        // creamos el request
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //Header aplication JSON
        return request
    }
}
