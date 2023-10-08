//
//  ViewController.swift
//  20231008_ManojMoola_NYCSchools
//
//  Created by Manoj on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nycSchoolsTableView: UITableView!
    
    // MARK: - View Model
    var nycSchoolsViewModel = NYCSchoolsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setConfigurations()
        fetchSchoolsList()
    }
    
    // MARK: - Helper Methods
    
    // Configure the view model delegate
    func setConfigurations() {
        //This will be the delegate which responds when there is a response....
        nycSchoolsViewModel.schoolDelegate = self
    }
    
    // Fetch the list of NYC schools
    func fetchSchoolsList() {
        nycSchoolsViewModel.fetchNYCSchoolsList()
    }
}
    
    // MARK: UITableViewDataSource and UITableViewDelegate Extensions
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           nycSchoolsViewModel.schoolsList.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.nycSchoolsTableView.dequeueReusableCell(withIdentifier: Constants.nycSchoolsCellIdentifier, for: indexPath) as! NYCSchoolTableViewCell
        
        cell.schoolNameLabel.text = nycSchoolsViewModel.schoolsList[indexPath.row].school_name
        cell.schoolAddressLabel.text = nycSchoolsViewModel.schoolsList[indexPath.row].primary_address_line_1! + ", " + nycSchoolsViewModel.schoolsList[indexPath.row].city! + ", " + nycSchoolsViewModel.schoolsList[indexPath.row].state_code!
        cell.phoneNumberLabel.text = nycSchoolsViewModel.schoolsList[indexPath.row].phone_number
        
        return cell
    }
    
    //MARK: - UITable View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nycDetailsVC =  UIStoryboard(name: Constants.main_Xib, bundle: nil).instantiateViewController(withIdentifier: Constants.nycSchoolDetailsViewControllerxibId) as? NYCSchoolDetailsViewController
        //Takes us to details page to see SAT details with dbn as unique key
        nycDetailsVC?.nycSchool = nycSchoolsViewModel.schoolsList[indexPath.row]
        print(self.navigationController!)
        self.navigationController?.pushViewController(nycDetailsVC!, animated: true)
        
        
    }
}

extension ViewController: SchoolsListServices {
    func reloadData() {
        guard let _ = self.nycSchoolsTableView else {
            return
        }
        self.nycSchoolsTableView.reloadData()
    }
}
        

