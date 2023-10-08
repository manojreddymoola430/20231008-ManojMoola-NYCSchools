//
//  NYCSchoolsViewModel.swift
//  20231008_ManojMoola_NYCSchools
//

//  Created by Manoj on 10/7/23.
//

import Foundation

// A view model responsible for managing NYC school data
class NYCSchoolsViewModel
{
    // A weak reference to the delegate for communication with the view
    weak var schoolDelegate: SchoolsListServices?
    
    // An array to store the list of NYC schools, triggering delegate update when modified
    var schoolsList: [NYCSchool] = [] {
        didSet {
            // Notify the delegate to reload data when schoolsList is updated
            self.schoolDelegate?.reloadData()
        }
    }
    
    // Asynchronously fetches the list of NYC schools from a network source
    @MainActor func fetchNYCSchoolsList() {
        Task {
            do {
                // Attempt to fetch the list of NYC schools using a network call
                let schoolsListResponse: [NYCSchool] = try await NetworkManager.fetchSchoolData(url: NetworkConstants.nycSchoolsURL)
                // Update schoolsList with the retrieved data
                self.schoolsList = schoolsListResponse
            } catch {
                // Handle and print any errors that occur during the fetch
                print(error)
            }
        }
    }
}

// A protocol for data binding and communication between the view model and the view
protocol SchoolsListServices: AnyObject {
    func reloadData()
}
