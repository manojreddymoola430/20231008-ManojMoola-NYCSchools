import UIKit

// A model class representing SAT details for NYC schools, conforming to Decodable for JSON decoding
class NYCSATDetails: Decodable {

    // Properties representing various SAT details for a school
    var dbn: String?
    var school_name: String?
    var num_of_sat_test_takers: String?
    var sat_critical_reading_avg_score: String?
    var sat_math_avg_score: String?
    var sat_writing_avg_score: String?
    

    // Initializer to create an instance of NYCSATDetails with all properties
    init(dbn: String?, school_name: String?, num_of_sat_test_takers: String?, sat_critical_reading_avg_score: String?, sat_math_avg_score: String?, sat_writing_avg_score: String?) {
        self.dbn = dbn
        self.school_name = school_name
        self.num_of_sat_test_takers = num_of_sat_test_takers
        self.sat_critical_reading_avg_score = sat_critical_reading_avg_score
        self.sat_math_avg_score = sat_math_avg_score
        self.sat_writing_avg_score = sat_writing_avg_score
    }
}
