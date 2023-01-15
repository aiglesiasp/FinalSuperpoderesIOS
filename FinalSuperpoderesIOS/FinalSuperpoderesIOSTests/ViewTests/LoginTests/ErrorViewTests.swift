//
//  ErrorViewTests.swift
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
extension ErrorView: Inspectable{}

final class ErrorViewTests: XCTestCase {

    func test_ErrorViews_AllItems() throws {
        let viewModel = RootViewModel()
        let view = ErrorView(errorString: "").environmentObject(viewModel)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let backgroundImage = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(backgroundImage)
        
        let backgroundImageOpacity = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(backgroundImageOpacity)
        
        let title = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(title)
        
        let text = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(text)
        
        let button = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(text)
        try button.button().tap()
        XCTAssertEqual(viewModel.status, Status.login)
    
        let textButton = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(textButton)
        let textInside = try textButton.text().string()
        XCTAssertEqual(textInside, "VOLVER LOGIN")
        
        
        
        let spacer1 = try view.inspect().find(viewWithId: 7)
        XCTAssertNotNil(spacer1)
        
        let spacer2 = try view.inspect().find(viewWithId: 8)
        XCTAssertNotNil(spacer2)
        
    
    }

}
