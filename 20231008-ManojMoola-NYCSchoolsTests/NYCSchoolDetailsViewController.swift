//
//  NYCSchoolDetailsViewController.swift
//  20231008_ManojMoola_NYCSchoolsTests
//
//  Created by Manoj on 10/7/23.
//

import XCTest
@testable import _0231008_ManojMoola_NYCSchools

class NYCSchoolDetailsViewControllerTests: XCTestCase {
    
    var viewController: NYCSchoolDetailsViewController!

    override func setUp() {
        super.setUp()
        
        // Create an instance of the NYCSchoolDetailsViewController from your storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "NYCSchoolDetailsViewController") as? NYCSchoolDetailsViewController
        
        // Load the view controller's view hierarchy
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }

    // Mock implementation of NYCSchoolsDetailsViewModel for testing purposes
    class MockNYCSchoolsDetailsViewModel: NYCSchoolsDetailsViewModel {
        var mockSATDetailsList: [NYCSATDetails] = []
        
        override func fetchNYCSchoolDetailsList() {
            // Simulate the API call by updating the satDetailsList with mock data
            satDetailsList = mockSATDetailsList
            // Call the delegate method to notify the view controller
            SATDetailsDelegate?.updateData()
        }
    }
    
    func testUpdateDetails() {
        // Create a mock SATDetailsViewModel with sample SAT details
        let mockViewModel = MockNYCSchoolsDetailsViewModel()
        
        // Create a mock NYCSchool with a DBN that matches the mock SAT details
        let mockNYCSchool  = NYCSchool.init(dbn: "6789", school_name: "Boston High School", primary_address_line_1: "Address1", city: "Chicago", state_code: "12345", school_email: "abc@gmail.com", phone_number: "1234567890", website: "www.google.com", overview_paragraph: "The mission of Brooklyn High School for Law and Technology is to intellectually prepare, morally inspire, and socially motivate every student to become a leader in this vastly changing society. Our curriculum in biomedical science, engineering, software engineering, and law are blueprints for all students to succeed in any competitive college program. At Brooklyn High School for Law and Technology, the overall goal is to cultivate exceptional leaders prepared to serve and lead globally.")
        
        // Create mock SAT details
            let mockSATDetails = NYCSATDetails.init(dbn: "6789",
                                           school_name: "Boston High School", num_of_sat_test_takers: "50",
                                           sat_critical_reading_avg_score: "550", sat_math_avg_score: "500",
                                            sat_writing_avg_score: "520")
        
        // Set up the view controller
        viewController.nycSchool = mockNYCSchool
        viewController.nycSATDetailsViewModel = mockViewModel
        
        // Set the mock SAT details in the view model
        mockViewModel.mockSATDetailsList = [mockSATDetails]
        
        // Call the fetchSATDetailsList method to trigger data retrieval
        viewController.fetchSATDetailsList()
        
        // Call the updateDetails method
        viewController.updateDetails()
        
        // Assert that the labels are updated correctly
        XCTAssertEqual(viewController.titleTextView.text, "Boston High School")
        XCTAssertEqual(viewController.mathSatLabel.text, "SAT MATH AVERAGE SCORE : 500")
        XCTAssertEqual(viewController.readingSatLabel.text, "SAT CRITICAL READING AVERAGE SCORE : 550")
        XCTAssertEqual(viewController.writingSatLabel.text, "SAT WRITING AVERAGE SCORE : 520")
        XCTAssertEqual(viewController.descriptionTextView.text, "The mission of Brooklyn High School for Law and Technology is to intellectually prepare, morally inspire, and socially motivate every student to become a leader in this vastly changing society. Our curriculum in biomedical science, engineering, software engineering, and law are blueprints for all students to succeed in any competitive college program. At Brooklyn High School for Law and Technology, the overall goal is to cultivate exceptional leaders prepared to serve and lead globally.")
    }
}

