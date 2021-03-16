//
//  Lesson.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import Foundation

// MARK: - Lesson
struct Lesson: Codable {
    var lessonTypeID, hours, realHours: String?

    enum CodingKeys: String, CodingKey {
        case lessonTypeID = "LessonTypeId"
        case hours = "Hours"
        case realHours = "RealHours"
    }
}
