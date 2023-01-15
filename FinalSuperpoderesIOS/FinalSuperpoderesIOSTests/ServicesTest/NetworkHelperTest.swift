//
//  NetworkHelperTest.swift
//  FinalSuperpoderesIOSTests
//
//  Created by Aitor Iglesias Pubill on 15/1/23.
//

import XCTest
@testable import FinalSuperpoderesIOS


final class NetworkHelperTest: XCTestCase {
    
    var sut: NetworkHelper!
    let heroId = 1
    
    override func setUpWithError() throws {
        sut = NetworkHelper()
    }
    override func tearDownWithError() throws {
        sut = nil
    }
  
    
    //MARK: - OBTENER HEROES -
    func test_getHeroes_Success() throws {
        let heroes = try? XCTUnwrap(sut.getSessionHeroes())
        XCTAssertNotNil(heroes, "Obtener heroes correctamente")
    }
    
    func test_getHeroes_WithGetMethod() throws {
        let heroes = try? XCTUnwrap(sut.getSessionHeroes())
        guard let heroes = heroes else {return}
        XCTAssertEqual(heroes.httpMethod, HTTPMethods.get, "El Metodo del HTTP es GET")
    }
    
    func test_getHeroes_WithOKURL() throws {
        let heroes = try? XCTUnwrap(sut.getSessionHeroes())
        guard let heroes = heroes else {return}
        XCTAssertTrue(heroes.url!.absoluteString.contains("https://gateway.marvel.com/v1/public/characters"), "La URL Esta correcta")
        
    }
    
    //MARK: - OBTENER SERIES
    func test_getSessionHeroesSeries_Succes() throws {
        let series = try? XCTUnwrap(sut.getSessionHeroesSeries(heroId: heroId))
        XCTAssertNotNil(series, "Obtener heroes correctamente")
    }
    
    func test_getSessionHeroesSeries_WithGetMethod() throws {
        let series = try? XCTUnwrap(sut.getSessionHeroesSeries(heroId: heroId))
        guard let series = series else {return}
        XCTAssertEqual(series.httpMethod, HTTPMethods.get, "El Metodo del HTTP es GET")
    }
    
    func test_getSessionHeroesSeries_WithOKURL() throws {
        let series = try? XCTUnwrap(sut.getSessionHeroesSeries(heroId: heroId))
        guard let series = series else {return}
        XCTAssertTrue(series.url!.absoluteString.contains("https://gateway.marvel.com/v1/public/characters"), "La URL Esta correcta")
        
    }
    
    //MARK: - OBTENER COMICS
    func test_getSessionHeroesComics_Succes() throws {
        let series = try? XCTUnwrap(sut.getSessionHeroesComics(heroId: heroId))
        XCTAssertNotNil(series, "Obtener heroes correctamente")
    }
    
    func test_getSessionHeroesComics_WithGetMethod() throws {
        let series = try? XCTUnwrap(sut.getSessionHeroesComics(heroId: heroId))
        guard let series = series else {return}
        XCTAssertEqual(series.httpMethod, HTTPMethods.get, "El Metodo del HTTP es GET")
    }
    
    func test_getSessionHeroesComics_WithOKURL() throws {
        let series = try? XCTUnwrap(sut.getSessionHeroesComics(heroId: heroId))
        guard let series = series else {return}
        XCTAssertTrue(series.url!.absoluteString.contains("https://gateway.marvel.com/v1/public/characters"), "La URL Esta correcta")
        
    }
    
    
    

}
