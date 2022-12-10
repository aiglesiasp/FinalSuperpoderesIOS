//
//  NetworkHelper.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation

//Creo el servidor
let server = "https://gateway.marvel.com"
let publicKey = "cfa84e8f63e43679a5f9299c92a964a7"
let privateKey = "eec98a5800df793ca31812187b3ae75e91597d9a"
let ts = "1"
let hash = "6ee3533574aa152e469b939894ec2f49"

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
    
    //MARK: EJEMPLO FUNCION LOGIN
    func getSessionLogin(user: String, password: String) -> URLRequest {
        let urlCad: String = "\(server)\(Endpoints.heroesList.rawValue)"
        //Crear el USER:PASSWORD
        let encondeCredential = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var segCredential = ""
        if let credential = encondeCredential {
            segCredential = "Basic \(credential)"
        }
        
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        //request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        //request.addValue(segCredential, forHTTPHeaderField: "Authorization")
        
        return request
        
    }
    
    //MARK: - FUNCION OBTENER LISTA COMPLETA HEROES
    func getSessionHeroes(filter: [Parametro]?) -> URLRequest? {
        //Montamos URL
        
        
        let urlCad: String = "\(server)\(Endpoints.heroesList.rawValue)"
        //Creamos REQUEST
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(ts, forHTTPHeaderField: "ts")
        request.addValue(hash, forHTTPHeaderField: "hash")
        request.addValue(publicKey, forHTTPHeaderField: "publicKey")
        
        return request
    }
}
