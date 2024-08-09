//
//  StudentsListVC.swift
//  NewUNI
//
//  Created by Mahdi on 5/19/1403 AP.
//

import UIKit

class StudentsListVC: UIViewController {
    
    let bussinessLogic = BussinessLogic()
    var allStudents: [Student] { 
        return bussinessLogic.allStudent ?? []
    }
    
    @IBOutlet weak var newStudentFirstNameField: UITextField!
    @IBOutlet weak var newStudentLastNameField: UITextField!
    @IBOutlet weak var addNewStudentBottom: UIButton!
    @IBOutlet weak var searchStudentBottom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func StudentDataCompleted(_ sender: Any) {
        
        addNewStudentBottom.isEnabled = newStudentLastNameField.text != "" && newStudentFirstNameField.text != ""
        searchStudentBottom.isEnabled = addNewStudentBottom.isEnabled
    }
    
}

extension StudentsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") else {
            
            return UITableViewCell()
        }
        cell.textLabel?.text = allStudents[indexPath.row].firstName
        cell.detailTextLabel?.text = allStudents[indexPath.row].lastName
        return cell
    }
}
