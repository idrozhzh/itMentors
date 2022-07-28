//
//  ViewController.swift
//  itMentors
//
//  Created by alexkarav on 26.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginBtnTapped() {
        if loginTF.text == "" && passwordTF.text == "" {
            let alert = UIAlertController(title: "Oops, you enter empty login or password🫥", message: "Enter correct password and login", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "mainVC", sender: nil)
        }
    }
    
    // MARK: - Navigation
    //Переход к dev team
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainVC" {
            let user = User(login: loginTF.text ?? "", password: passwordTF.text ?? "")
            // Realise you logic to transfer User
        }
        //Realise you logic to dev team
    }

}

// MARK: - Extensions
extension LoginViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
