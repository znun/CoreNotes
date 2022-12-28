//
//  DetailVC.swift
//  Notes
//
//  Created by Mahmudul Hasan on 27/12/22.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var txtEmployeeEmail: UITextField!
    
    private let manager = UserManager()
    var selectedEmployee : iUser? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
