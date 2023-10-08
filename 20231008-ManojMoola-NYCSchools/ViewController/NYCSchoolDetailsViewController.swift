//
//  NYCSchoolDetailsViewController.swift
//  20231008_ManojMoola_NYCSchools
//
//  Created by Manoj on 10/7/23.
//

import Foundation
import UIKit

class NYCSchoolDetailsViewController: ViewController
{
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextView: UITextView!
    
    @IBOutlet weak var mathSatLabel: UILabel!
    
    @IBOutlet weak var writingSatLabel: UILabel!
    @IBOutlet weak var readingSatLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    // MARK: - Properties
    //a variable to hold the data from the list of schools ViewController
    var nycSchool: NYCSchool?
    var nycSATDetailsViewModel = NYCSchoolsDetailsViewModel()

    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupConfigurations()
        fetchSATDetailsList()
    }
    // Configure the view model delegate
    func setupConfigurations()
    {
        nycSATDetailsViewModel.SATDetailsDelegate = self
    }
    
    // Fetch SAT details list
    func fetchSATDetailsList()
    {
        nycSATDetailsViewModel.fetchNYCSchoolDetailsList()
    }
    
    // Update the details in the UI
    func updateDetails()
    {
        let nycSATSchool = nycSATDetailsViewModel.satDetailsList.filter{($0.dbn!) == self.nycSchool!.dbn}.first
        titleTextView.text = nycSchool?.school_name
        mathSatLabel.text =  Constants.sat_mat_avg + (nycSATSchool?.sat_math_avg_score! ?? "")
        readingSatLabel.text = Constants.sat_reading_avg + (nycSATSchool?.sat_critical_reading_avg_score! ?? "")
        writingSatLabel.text = Constants.sat_writing_avg + (nycSATSchool?.sat_writing_avg_score! ?? "")
        descriptionTextView.text = nycSchool!.overview_paragraph
    }
}

// MARK: - SATDetailsServices Extension
extension NYCSchoolDetailsViewController: SATDetailsServices {
    func updateData() {
        updateDetails()
    }
}

