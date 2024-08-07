//
//  Student.swift
//  NewUNI
//
//  Created by Mahdi on 5/17/1403 AP.
//

import Foundation

struct Student {
    let firstName : String
    let lastName : String
    var selectetedCourse : [String]?
    let id : Int
    let profId : Int?

    init(firstName : String, lastName : String, id : Int ,profId: Int? = nil , selectetedCourse : [String]? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.selectetedCourse = selectetedCourse
        self.profId = profId
    }
    
    mutating func addCourse(course : String) {
        selectetedCourse?.append(course)
    }
    
}
