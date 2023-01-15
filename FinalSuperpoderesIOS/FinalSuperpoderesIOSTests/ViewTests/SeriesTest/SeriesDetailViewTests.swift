//
//  SeriesDetailViewTests.swift
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
extension SeriesDetailView: Inspectable{}

final class SeriesDetailViewTests: XCTestCase {

    func test_SeriesDetailView_AllItems() throws {
        let viewModel = RootViewModel()
    
        let serie = Serie(id: 1, title: "", description: "", thumbnail: Thumbnail(path: "", thumbnailExtension: ""))
        let view = SeriesDetailView(serie: serie).environmentObject(viewModel)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let asyncImage = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(asyncImage)
        
        let image = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        
        let text2 = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(text2)
        
        let description = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(description)
        
    }

}

