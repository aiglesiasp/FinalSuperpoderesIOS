//
//  LoadingViewTests.swift
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
extension LoadingView: Inspectable{}

final class LoadingViewTests: XCTestCase {

    func test_LoadingViews_AllItems() throws {
        let viewModel = RootViewModel()
        let view = LoadingView().environmentObject(viewModel)
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
    
        let spacer1 = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(spacer1)
        
        let spacer2 = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(spacer2)
        
        let spacer3 = try view.inspect().find(viewWithId: 7)
        XCTAssertNotNil(spacer3)
        
        XCTAssertEqual(viewModel.status, Status.login)
    }

}
