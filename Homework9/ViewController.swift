//
//  ViewController.swift
//  Homework9
//
//  Created by Marat Tazhetdinov on 13.07.2021.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func getResult (color: UIColor)
}

class ViewController: UIViewController, UITextFieldDelegate, ViewControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        guard !nameTextField.text!.isEmpty else {return}
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2{
            vc.delegate = self
            vc.resultName = "\(nameTextField.text!)"
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else {return true}
        if Int(string) == nil {
            return true
        } else {
            return false
        }
    }
    
    func getResult(color: UIColor) {
        self.view.backgroundColor = color
    }
    

}

