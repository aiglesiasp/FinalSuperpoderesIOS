//
//  HomeRowViewTests.swift
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
extension HomeRowView: Inspectable{}

final class HomeRowViewTests: XCTestCase {

    func test_HomeRowVIew_AllItems() throws {
        let viewModel = RootViewModel()
        let homeViewModel = HomeViewModel()
        let hero = Hero(id: 1, name: "", description: "", thumbnail: Thumbnail(path: "", thumbnailExtension: ""), resourceURI: "", modified: "")
    
        let view = HomeRowView(hero: hero).environmentObject(viewModel)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let asyncImage = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(asyncImage)
        
        let image = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        
        XCTAssertEqual(viewModel.status, Status.login)
        
    }

}
