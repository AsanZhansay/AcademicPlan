//
//  AcademicPlan.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import Foundation

// MARK: - Academic Plan
struct AcademicPlan: Codable {
    var iupSid, title, documentURL, academicYearID: String?
    var academicYear: String?
    var semesters: [Semester]?

    enum CodingKeys: String, CodingKey {
        case iupSid = "IUPSid"
        case title = "Title"
        case documentURL = "DocumentURL"
        case academicYearID = "AcademicYearId"
        case academicYear = "AcademicYear"
        case semesters = "Semesters"
    }
}
