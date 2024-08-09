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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = student?.firstName.appending(" " + student!.lastName)
        studentIdField.text = "ID: \(String(describing: student!.id))"
        profNameField.text = "Prof ID: \(String(describing: student!.profId))"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
