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
        self.title = student?.firstName.appending(" " + student!.lastName)
        studentIdField.text = "ID: \(String(describing: student!.id))"
        profNameField.text = "Prof ID: \(String(describing: student!.profId))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newCourseField(_ sender: Any) {
        
        addCourseButton.isEnabled = newCourseField.text != ""
    }
}

extension StudentsDetailVC: UITabBarDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cnt = student?.selectetedCourse?.count else {
            
            return 0
        }
        
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") else {
            
            return UITableViewCell()
        }
        cell.textLabel?.text = student?.selectetedCourse![indexPath.row]
        
        return cell
    }
    
    
    
}
