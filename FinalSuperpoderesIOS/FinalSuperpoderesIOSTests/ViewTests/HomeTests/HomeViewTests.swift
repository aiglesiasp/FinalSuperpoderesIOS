//
//  HomeViewTests.swift
//  FinalSuperpoderesIOSTests
//
//  Created by Aitor Iglesias Pubill on 15/1/23.
//


import XCTest
import SwiftUI
import Combine
import ViewInspector
@testable import FinalSuperpoderesIOS

//VISTAS A TESTEAR
extension HomeView: Inspectable{}

final class HomeViewTests: XCTestCase {

    func test_HomeView_AllItems() throws {
        let viewModel = RootViewModel()
        let homeViewModel = HomeViewModel()
    
        let view = HomeView(homeViewModel: homeViewModel).environmentObject(viewModel)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let navigationStack = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(navigationStack)
        
        let backgroundImageOpacity = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(backgroundImageOpacity)
        
        let title = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(title)
        
        let image = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(text)
        
        XCTAssertEqual(viewModel.status, Status.login)
        
    }

}
