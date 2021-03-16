//
//  LessonType.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import Foundation

// MARK: - Lesson type
enum LessonType: String, CaseIterable {
    case lecture = "1"
    case seminar = "2"
    case laboratory = "3"
}

// MARK: - Lesson item
struct LessonItem {
    var type: LessonType
    var name: String
}
