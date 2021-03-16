//
//  Semester.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import Foundation

// MARK: - Semester
struct Semester: Codable {
    var number: String?
    var disciplines: [Discipline]?

    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case disciplines = "Disciplines"
    }
}
