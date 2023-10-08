//
//  NYCSchoolsDetailsViewModel.swift
//  20231008_ManojMoola_NYCSchools
//
//  Created by Manoj on 10/7/23.
//

import Foundation

// A view model responsible for managing NYC school SAT details data
class NYCSchoolsDetailsViewModel
{
    // An array to store the list of NYC school SAT details, triggering delegate update when modified
    var satDetailsList: [NYCSATDetails] = [] {
        didSet {
            // Notify the delegate to update data when satDetailsList is updated
            self.SATDetailsDelegate?.updateData()
        }
    }
    
    // A weak reference to the delegate for communication with the view
    weak var SATDetailsDelegate: SATDetailsServices?
    
    // Asynchronously fetches the list of NYC school SAT details from a network source
    @MainActor func fetchNYCSchoolDetailsList() {
        Task { //avoids adding multiple asyncs in await calls stack
            do {
                // Attempt to fetch the list of NYC school SAT details using a network call
                let satDetailsListResponse: [NYCSATDetails] = try await NetworkManager.fetchSchoolSATDetailsData(url: NetworkConstants.nycSATDetailsURL)
                // Update satDetailsList with the retrieved data
                self.satDetailsList = satDetailsListResponse
            } catch {
                // Handle and print any errors that occur during the fetch
                print(error)
            }
        }
    }
}

// A protocol for data binding and communication between the view model and the view
protocol SATDetailsServices: AnyObject {
    func updateData()
}
