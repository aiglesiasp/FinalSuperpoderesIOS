//
//  HomeViewModelTests.swift
//  FinalSuperpoderesIOSTests
//
//  Created by Aitor Iglesias Pubill on 15/1/23.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector
@testable import FinalSuperpoderesIOS

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    override func setUpWithError() throws {
        sut = HomeViewModel(testing: false)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_TestingPrueba() throws {
        sut = HomeViewModel(testing: true)
        
        XCTAssertEqual(sut.heros?.count, 3)
        XCTAssertEqual(sut.heros?[0].name, "Peggy Carter (Captain Carter)")
    }
    
    func test_HomeViewModel_Succes() throws {
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
        
        sut.getHeros()
        self.waitForExpectations(timeout: 10)
        
    }

    
}
