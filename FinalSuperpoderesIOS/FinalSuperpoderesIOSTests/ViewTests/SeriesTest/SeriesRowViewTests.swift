//
//  SeriesRowViewTests.swift
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
extension SeriesRowView: Inspectable{}

final class SeriesROwViewTests: XCTestCase {

    func test_SeriesRowView_AllItems() throws {
        let viewModel = RootViewModel()
        let serie = Serie(id: 1, title: "", description: "", thumbnail: Thumbnail(path: "", thumbnailExtension: ""))
    
        let view = SeriesRowView(serie: serie).environmentObject(viewModel)
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
