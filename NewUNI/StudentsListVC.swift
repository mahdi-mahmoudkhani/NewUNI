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
        return self.bussinessLogic.allStudent ?? []
    }
    var filterredStudentsList: [Student] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newStudentFirstNameField: UITextField!
    @IBOutlet weak var newStudentLastNameField: UITextField!
    @IBOutlet weak var addNewStudentButton: UIButton!
    @IBOutlet weak var searchStudentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToStudentsDetailVC" {
            if let destinationVC = segue.destination as? StudentsDetailVC {
                destinationVC.student = sender as? Student
            }
        }
    }
    
    @IBAction func StudentDataCompleted(_ sender: Any) {
        
        self.addNewStudentButton.isEnabled = self.newStudentLastNameField.text != "" && self.newStudentFirstNameField.text != ""
    }
    
    @IBAction func addNewStudent(_ sender: Any) {
        
        if !self.allStudents.contains(where: {
            
            $0.firstName == self.newStudentFirstNameField.text
            && $0.lastName == self.newStudentLastNameField.text
        }) {
            
            if self.bussinessLogic.allStudent == nil { self.bussinessLogic.allStudent = [] }
            
            self.bussinessLogic.allStudent!.append( Student(firstName: self.newStudentFirstNameField.text!, lastName: self.newStudentLastNameField.text!, id: Int(Date().timeIntervalSince1970)) )
            
            self.newStudentFirstNameField.text = ""
            self.newStudentLastNameField.text = ""
            
            self.filterredStudentsList = self.allStudents
            
            self.tableView.reloadData()
            
        } else {
            
            return
        }
    }
    
    @IBAction func searchStudents(_ sender: Any) {
        
        self.filterredStudentsList = self.allStudents.filter({ student in
            
            let matchedFirstName = self.newStudentFirstNameField.text == "" || student.firstName.uppercased().contains( (self.newStudentFirstNameField.text?.uppercased())! )
            let matchedLastName = self.newStudentLastNameField.text == "" || student.lastName.uppercased().contains( (self.newStudentLastNameField.text?.uppercased())! )
            
            return matchedLastName && matchedFirstName
        })
        
        self.tableView.reloadData()
    }
}

extension StudentsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filterredStudentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") else {
            
            return UITableViewCell()
        }
        cell.textLabel?.text = self.filterredStudentsList[indexPath.row].firstName
        cell.detailTextLabel?.text = self.filterredStudentsList[indexPath.row].lastName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ToStudentsDetailVC", sender: self.filterredStudentsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
        
            removeStudent(stuID: self.filterredStudentsList[indexPath.row].id)
            self.filterredStudentsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    private func removeStudent(stuID: Int) {
        
        let stuIndex = self.bussinessLogic.allStudent?.firstIndex(where: { student in
            student.id == stuID
        })
        
        self.bussinessLogic.allStudent?.remove(at: stuIndex!)
    }
}
