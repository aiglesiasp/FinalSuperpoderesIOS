//
//  SeriesViewModelTests.swift
//  FinalSuperpoderesIOSTests
//
//  Created by Aitor Iglesias Pubill on 15/1/23.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector
@testable import FinalSuperpoderesIOS

final class SeriesViewModelTests: XCTestCase {

    var sut: SeriesViewModel!
    override func setUpWithError() throws {
        sut = SeriesViewModel(testing: false, heroId: 1)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_TestingPrueba() throws {
        sut = SeriesViewModel(testing: true, heroId: 1)
        XCTAssertEqual(sut.series?.count, 4)
        XCTAssertEqual(sut.series?[0].title, "Hit-Monkey By Daniel Way: Bullets & Bananas (2019)")
    }
    
    func test_SeriesViewModel_Succes() throws {
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Descarga de heroes")
        
        XCTAssertNotNil(sut)
        
        sut.$status.sink { estado in
            //Cambia el estado
            if estado == .loaded {
                XCTAssertEqual(1, 1)
                expectation.fulfill()
            } else if estado == .error(error: "") {
                XCTAssertEqual(1, 2)
                expectation.fulfill()
            }
        }
        .store(in: &suscriptor)
        
        sut.getSeries(heroId: 1)
        self.waitForExpectations(timeout: 10)
        
    }

}
