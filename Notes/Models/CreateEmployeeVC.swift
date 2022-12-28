//
//  ViewController.swift
//  Notes
//
//  Created by Mahmudul Hasan on 24/12/22.
//

import UIKit

class CreateEmployeeVC: UIViewController {

    
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var txtEnterName: UITextField!
    @IBOutlet weak var txtEnterEmail: UITextField!
    
    private let manager : UserManager = UserManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path[0])
    }


    @IBAction func createButtonPressed(_ sender: Any) {
        let employee = iUser(name: txtEnterName.text, email: txtEnterEmail.text, profilePicture: imgProfilePic.image?.pngData(), id: UUID())
        manager.createUser(user: employee)
        self.performSegue(withIdentifier: "navigateToEmployeeeList" , sender: nil)
    }
    
}

