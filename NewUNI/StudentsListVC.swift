//
//  StudentsListVC.swift
//  NewUNI
//
//  Created by Mahdi on 5/19/1403 AP.
//

import UIKit

class StudentsListVC: UIViewController {
    
    var bussinessLogic = BussinessLogic()
    var allStudents: [Student] {
        return bussinessLogic.allStudent ?? []
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newStudentFirstNameField: UITextField!
    @IBOutlet weak var newStudentLastNameField: UITextField!
    @IBOutlet weak var addNewStudentButton: UIButton!
    @IBOutlet weak var searchStudentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func StudentDataCompleted(_ sender: Any) {
        
        addNewStudentButton.isEnabled = newStudentLastNameField.text != "" && newStudentFirstNameField.text != ""
        searchStudentButton.isEnabled = addNewStudentButton.isEnabled
    }
    
    @IBAction func addNewStudent(_ sender: Any) {
        
        if !allStudents.contains(where: { 
            
            $0.firstName == newStudentFirstNameField.text
            && $0.lastName == newStudentLastNameField.text
        }) {
            
            if bussinessLogic.allStudent == nil { bussinessLogic.allStudent = [] }
            
            bussinessLogic.allStudent!.append( Student(firstName: newStudentFirstNameField.text!, lastName: newStudentLastNameField.text!, id: Int(Date().timeIntervalSince1970)) )
            
            newStudentFirstNameField.text = ""
            newStudentLastNameField.text = ""
            
            tableView.reloadData()
            
        } else {
            
            return
        }
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
