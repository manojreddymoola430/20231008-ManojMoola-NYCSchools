//
//  Constants.swift
//  20231008_ManojMoola_NYCSchools
//
//  Created by Manoj on 10/7/23.
//

import Foundation

// Constants for the application
struct Constants {
    static let main_Xib =  "Main"
    // Identifier for the NYC schools table view cell
    static let nycSchoolsCellIdentifier = "nycSchoolTableCell"
    static let nycSchoolDetailsViewControllerxibId = "NYCSchoolDetailsViewController"
    static let sat_mat_avg =  "SAT MATH AVERAGE SCORE : "
    static let sat_reading_avg =  "SAT CRITICAL READING AVERAGE SCORE : "
    static let sat_writing_avg =  "SAT WRITING AVERAGE SCORE : "
}

// Constants related to network URLs
struct NetworkConstants {
    // URL for fetching NYC schools data
    static let nycSchoolsURL = "https://data.cityofnewyork.us/resource/uq7m-95z8.json"
    
    // URL for fetching NYC school SAT details data
    static let nycSATDetailsURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}

