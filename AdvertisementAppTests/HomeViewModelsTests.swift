//
//  HomeViewModelsTests.swift
//  AdvertisementAppTests
//
//  Created by Mouldi GABSI on 05/02/2021.
//

import XCTest

@testable import AdvertisementApp
@testable import LBCAnnouncementsCore

class HomeViewModelsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewModelWillBeEmpltyUsingEmptyJSON()  {
        
        let mockAPIService = MockHomeAPIService(fileName: "empty_advertisement_list")
        mockAPIService.fetchAdvertisementsList { (result:Result<[Advertisement], APIError>) in
            
            switch result {
            case .success(let advertisements):
                XCTAssertEqual(advertisements.count, 2 , "result should be a success")
                let viewModel = HomeWorker().generateViewModel(advertisements: advertisements)
                XCTAssertNotNil(viewModel, "View Model should not be nil")
                XCTAssertEqual(viewModel?.count, 0, "viewModel should be empty")
            case.failure(let error):
                XCTFail("result should be success not an \(error.message) error")
            }
        }
    }
    
    func testViewModelWillContainRightNumberOfSectionsJSON() {
        
        let mockAPIService = MockHomeAPIService(fileName: "two_advertisement_list")
        mockAPIService.fetchAdvertisementsList { (result:Result<[Advertisement], APIError>) in
            
            switch result {
            case .success(let advertisements):
                XCTAssertEqual(advertisements.count, 2 , "result should be a success with 2 values")
                let viewModel = HomeWorker().generateViewModel(advertisements: advertisements)
                XCTAssertNotNil(viewModel, "View Model should not be nil")
                XCTAssertEqual(viewModel?.count, 1, "viewModel should not be empty")
                XCTAssertEqual(viewModel?.numberOfRows(0), 2, "viewModel should have 2 rows in the first section")
            case.failure(let error):
                XCTFail("result should be success not an \(error.message) error")
            }
        }
    }
    
    func testViewModelWillContainTheRightsInformations() {
        let mockAPIService = MockHomeAPIService(fileName: "two_advertisement_list")
        mockAPIService.fetchAdvertisementsList { (result:Result<[Advertisement], APIError>) in
            
            switch result {
            case .success(let advertisements):
                let viewModel = HomeWorker().generateViewModel(advertisements: advertisements)
                XCTAssertNotNil(viewModel, "View Model should not be nil")
                XCTAssertEqual(viewModel?.count, 1, "viewModel should not be empty")
                XCTAssertEqual(viewModel?.numberOfRows(0), 2, "viewModel should have 2 rows in the first section")
                if let firstRow = viewModel?.row(rowAt: IndexPath(row: 0, section: 0)) as? AdvertisementRowViewModel {
                    XCTAssertEqual(firstRow.title, "Statue homme noir assis en plâtre polychrome", "")
                    XCTAssertEqual(firstRow.category, .home, "")
                    XCTAssertEqual(firstRow.price, 140.00, "")
                    XCTAssertEqual(firstRow.isUrgent, false, "")
                } else {
                    XCTFail("first row should be of type AdvertisementRowViewModel ")
                }
                
            case.failure(let error):
                XCTFail("result should be success not an \(error.message) error")
            }
        }
    }

}
