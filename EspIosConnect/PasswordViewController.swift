//
//  PasswordViewController.swift
//  EspIosConnect
//
//  Created by OUDJAMA Moussa (Canal Plus) on 12/02/2021.
//

import UIKit
import Alamofire

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var mdpTextField: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func changePassword(_ sender: Any) {
        guard let password = self.mdpTextField.text else {return}
        AF.request("http://10.33.1.63/new?password=\(password)").responseString { response in
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
