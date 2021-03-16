//
//  Discipline.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import Foundation

// MARK: - Discipline
struct Discipline: Codable {
    var disciplineID: String?
    var disciplineName: DisciplineName?
    var lessons: [Lesson]?

    enum CodingKeys: String, CodingKey {
        case disciplineID = "DisciplineId"
        case disciplineName = "DisciplineName"
        case lessons = "Lesson"
    }
}

// MARK: - DisciplineName
struct DisciplineName: Codable {
    var nameKk, nameRu, nameEn: String?
}
