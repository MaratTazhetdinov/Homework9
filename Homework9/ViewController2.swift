//
//  ViewController2.swift
//  Homework9
//
//  Created by Marat Tazhetdinov on 13.07.2021.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {
    
    var resultName: String = ""
    @IBOutlet weak var labelWithName: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelWithName.text = "Hello, \(resultName)! Enter your age and sex:"
        ageTextField.delegate = self
        sexTextField.delegate = self

  
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == ageTextField {
            sexTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else {return true}
        if textField == sexTextField {
            if string.uppercased() == "M" || string.uppercased() == "F"{
                return true
            } else {
                return false
            }
        } else {
            if Int(string) == nil {
                return false
            } else {
                return true
            }
        }
        
        
    }
    
    @IBAction func buttonGoBack(_ sender: Any) {
        guard !ageTextField.text!.isEmpty || !sexTextField.text!.isEmpty  else {return}
        let age: Int = Int(String(ageTextField.text!))!
        
        if age > 50 && sexTextField.text?.uppercased() == "M"{
            delegate?.getResult(color: .red)
        } else if sexTextField.text?.uppercased() == "F" {
            delegate?.getResult(color: .yellow)
        } else {
            delegate?.getResult(color: .green)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
