//
//  StudentsDetailVC.swift
//  NewUNI
//
//  Created by Mahdi on 5/20/1403 AP.
//

import UIKit

class StudentsDetailVC: UIViewController {
    
    var student: Student?
    
    @IBOutlet weak var studentIdField: UILabel!
    @IBOutlet weak var profNameField: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newCourseField: UITextField!
    @IBOutlet weak var addCourseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.student?.firstName.appending(" " + self.student!.lastName)
        self.studentIdField.text = "ID: \(String(describing: self.student!.id))"
        self.profNameField.text = "Prof ID: \(String(describing: self.student!.profId))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newCourseField(_ sender: Any) {
        
        self.addCourseButton.isEnabled = self.newCourseField.text != ""
    }
    
    @IBAction func addCourse(_ sender: Any) {
        
        if (self.student?.selectetedCourse?.contains(where: { $0 == self.newCourseField.text } )) != nil {
            
            return
        }
        
        if self.student?.selectetedCourse == nil {
            
            self.student?.selectetedCourse = []
        }
        
        self.student?.selectetedCourse?.append(self.newCourseField.text!)
        self.newCourseField.text = ""
        self.tableView.reloadData()
    }
}

extension StudentsDetailVC: UITabBarDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cnt = self.student?.selectetedCourse?.count else {
            
            return 0
        }
        
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") else {
            
            return UITableViewCell()
        }
        cell.textLabel?.text = self.student?.selectetedCourse![indexPath.row]
        
        return cell
    }
    
    
    
}
