//
//  LoginViewController.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func didTapSignIn(_ sender: UIButton) {
        if let error = validate() {
            self.presentAlert(title: "Warning", message: error)
        } else {
            view.endEditing(false)
            startLoading()
        
            let params = ["username" : usernameTextField.text, "password": passwordTextField.text]
            Api().login(parameters: params, successHandler: { [weak self] (user: User) in
                DispatchQueue.main.async {
                    self?.stopLoading()
                    self?.performSegue(withIdentifier: "Home", sender: user.quotes)
                }
            }) { [weak self] (error: String?) in
                DispatchQueue.main.async {
                    self?.stopLoading()
                    self?.presentAlert(title: "Warning", message: error ?? "Failed to contact server")
                }
            }
        }
    }
    
    func validate() -> String? {
        guard let usernameLength = usernameTextField.text?.count, usernameLength > 3 else { return "Username length must be > 3" }
        guard let passwordLength = passwordTextField.text?.count, passwordLength > 6 else { return "Password length must be > 6" }
        return nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Home" {
            if let homeViewController = segue.destination.contents as? HomeViewController, let quotes = sender as? [String] {
                homeViewController.quotes = quotes
                usernameTextField.text = ""
                passwordTextField.text = ""
            }
        }
    }

    @IBAction func didTapDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}

