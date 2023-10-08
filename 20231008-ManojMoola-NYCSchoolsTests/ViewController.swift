//
//  ViewController.swift
//  20231008_ManojMoola_NYCSchoolsTests
//
//  Created by Manoj on 10/7/23.
//

import XCTest
@testable import _0231008_ManojMoola_NYCSchools

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        
        viewController = ViewController()
        
        
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
   

    // Mock a successful API call
    func testFetchSchoolsListSuccess() {
        // Create a mock API response with sample school data
        let mockSchoolData :[NYCSchool] = [NYCSchool.init(dbn: "1234", school_name: "Boston", primary_address_line_1: "Address1", city: "Chicago", state_code: "12345", school_email: "abc@gmail.com", phone_number: "1234567890", website: "www.google.com", overview_paragraph: "The mission of Brooklyn High School for Law and Technology is to intellectually prepare, morally inspire, and socially motivate every student to become a leader in this vastly changing society. Our curriculum in biomedical science, engineering, software engineering, and law are blueprints for all students to succeed in any competitive college program. At Brooklyn High School for Law and Technology, the overall goal is to cultivate exceptional leaders prepared to serve and lead globally."),NYCSchool.init(dbn: "6789", school_name: "Boston", primary_address_line_1: "Address1", city: "Chicago", state_code: "12345", school_email: "abc@gmail.com", phone_number: "1234567890", website: "www.google.com", overview_paragraph: "The mission of Brooklyn High School for Law and Technology is to intellectually prepare, morally inspire, and socially motivate every student to become a leader in this vastly changing society. Our curriculum in biomedical science, engineering, software engineering, and law are blueprints for all students to succeed in any competitive college program. At Brooklyn High School for Law and Technology, the overall goal is to cultivate exceptional leaders prepared to serve and lead globally."),]
        
        // Create a mock implementation of NYCSchoolsViewModel
        let mockViewModel = MockNYCSchoolsViewModel(mockSchoolsList: mockSchoolData)
        viewController.nycSchoolsViewModel = mockViewModel
        
        // Call the fetchSchoolsList method
        viewController.fetchSchoolsList()
        
        // Assert that the schoolsList in the view model is updated correctly
        XCTAssertEqual(viewController.nycSchoolsViewModel.schoolsList[0].dbn, mockSchoolData[0].dbn)
    }

    // Mock an unsuccessful API call
    func testFetchSchoolsListFailure() {
        // Create a mock implementation of NYCSchoolsViewModel with an empty schoolsList
        let mockViewModel = MockNYCSchoolsViewModel(mockSchoolsList: [])
        viewController.nycSchoolsViewModel = mockViewModel
        
        // Call the fetchSchoolsList method
        viewController.fetchSchoolsList()
        
        // Assert that the schoolsList in the view model remains empty or unchanged
        XCTAssertEqual(viewController.nycSchoolsViewModel.schoolsList.count, [].count)
    }
}

// Mock implementation of NYCSchoolsViewModel for testing purposes
class MockNYCSchoolsViewModel: NYCSchoolsViewModel {
    
    private let mockSchoolsList: [NYCSchool]
    
    init(mockSchoolsList: [NYCSchool]) {
        self.mockSchoolsList = mockSchoolsList
        super.init()
    }
    
    override func fetchNYCSchoolsList() {
        // Simulate the API call by updating the schoolsList with mock data
        schoolsList = mockSchoolsList
        // Call the delegate method to notify the view controller
        schoolDelegate?.reloadData()
    }
}

struct NycEquatable: Equatable {
    var dbn: String
    let school_name: String
    
    static func == (lhs: NycEquatable, rhs: NycEquatable) -> Bool {
        return lhs.dbn == rhs.dbn
    }
}

