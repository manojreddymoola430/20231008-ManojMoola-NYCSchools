//
//  NYCSchool.swift
//  20231008_ManojMoola_NYCSchools
//
//  Created by Manoj on 10/7/23.
//
import UIKit

// A model class representing NYC school information, conforming to Decodable for JSON decoding
class NYCSchool: Decodable {

    // Properties representing various attributes of the school
    var dbn: String?
    var school_name: String?
    var primary_address_line_1: String?
    var city: String?
    var state_code: String?
    var school_email: String?
    var phone_number: String?
    var website: String?
    var overview_paragraph :String?

    // Initializer to create an instance of NYCSchool with all properties
    init(dbn: String?, school_name: String?, primary_address_line_1: String?, city: String?, state_code: String?, school_email: String?, phone_number: String?, website: String?, overview_paragraph:String?) {
        self.dbn = dbn
        self.school_name = school_name
        self.primary_address_line_1 = primary_address_line_1
        self.city = city
        self.state_code = state_code
        self.school_email = school_email
        self.phone_number = phone_number
        self.website = website
        self.overview_paragraph = overview_paragraph
    }
}


