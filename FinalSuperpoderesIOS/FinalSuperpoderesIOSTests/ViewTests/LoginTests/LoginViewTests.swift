//
//  LoginViewTests.swift
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
extension LoginView: Inspectable{}

final class LoginViewTests: XCTestCase {


    func test_LoginViews_AllItems() throws {
        let viewModel = RootViewModel()
        let view = LoginView().environmentObject(viewModel)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let backgroundImage = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(backgroundImage)
        
        let list = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(list)
        
        let button = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(button)
        
        let textButton = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(textButton)
        let text = try textButton.text().string()
        XCTAssertEqual(text, "ENTRAR")
        
        let boton = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(boton)
        try boton.button().tap()
        XCTAssertEqual(viewModel.status, Status.loading)
        
        let spacer1 = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(spacer1)
        
        let spacer2 = try view.inspect().find(viewWithId: 7)
        XCTAssertNotNil(spacer2)
        
    }
}
