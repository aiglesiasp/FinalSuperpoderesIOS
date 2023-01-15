import XCTest
import SwiftUI
import Combine
import ViewInspector
@testable import FinalSuperpoderesIOS

//VISTAS A TESTEAR
extension SeriesView: Inspectable{}

final class SeriesViewsTests: XCTestCase {

    func test_SerieView_AllItems() throws {
        let viewModel = RootViewModel()
        let hero = Hero(id: 1, name: "", description: "", thumbnail: Thumbnail(path: "", thumbnailExtension: ""), resourceURI: "", modified: "")
        let seriesViewModel = SeriesViewModel(testing: true, heroId: hero.id)
    
        let view = SeriesView(seriesViewModel: seriesViewModel).environmentObject(viewModel)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let navigationStack = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(navigationStack)
        
        let list = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(list)
        
        XCTAssertEqual(viewModel.status, Status.login)
        
    }

}

