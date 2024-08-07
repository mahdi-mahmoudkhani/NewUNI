//
//  Prof.swift
//  NewUNI
//
//  Created by Mahdi on 5/17/1403 AP.
//

import Foundation

struct Prof {
    let firstName: String
    let lastName: String
    let profID: Int
    var supportStudents: [Student]?
    
    init(firstName: String, lastName: String, profID: Int, supportStudents: [Student]? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.profID = profID
        self.supportStudents = supportStudents
    }
    
    func addStudent(_ newStudent: Student , to prof : Prof ) -> Prof {
        var prof = prof
        guard !prof.supportStudents!.contains(where: { student in
            student.id == newStudent.id
        }) else {
            
            return prof
        }
        prof.supportStudents?.append(newStudent)
        return prof
    }
}
