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
    private let id : Int

    init(firstName : String, lastName : String, id : Int, selectetedCourse : [String]? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.selectetedCourse = selectetedCourse
    }
    
    mutating func addCourse(course : String) {
        selectetedCourse?.append(course)
    }
    
}
