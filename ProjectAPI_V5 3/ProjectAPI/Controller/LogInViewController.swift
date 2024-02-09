//
//  LogInViewController.swift
//  ProjectAPI
//
//  Created by english on 2023-11-14.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var userLogued : String = ""
    private var userTemp = User(username: "", password: "")
    
    @IBOutlet weak var txtUsername: UITextField!
    
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    
    @IBAction func btnSeePassword(_ sender: Any) {
        
        
        if(txtPassword.isSecureTextEntry == true){
            txtPassword.isSecureTextEntry = false
        }
        else{
            txtPassword.isSecureTextEntry = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnLogInTouchUpInside(_ sender: Any) {
        
        print("Before calling signin")
        
        //for empty username 
        guard let username = txtUsername.text, !username.isEmpty else {
            
            Toast.ok(view: self, title: "Login Failed", message: "Username cannot be empty")
            
            return
        }
                //for empty password
                guard let password = txtPassword.text, !password.isEmpty else {

                    Toast.ok(view: self, title: "Login Failed", message: "Password cannot be empty")

                    return

                }

//        Toast.ok(view: self, title: "Loggedin Successful", message: "Begin Your Search") { alertAction in
//
//
//              self.navigationController?.popViewController(animated: true)
//
        FrenchVerbAPI.signIn(email: txtUsername.text!, password:txtPassword.text! ) { token in
            
            DispatchQueue.main.async {

                print("Logged in with token \(token)")
                Context.loggedUserToken = token
                
                self.performSegue(withIdentifier: Segue.toVerbTableViewController, sender: self)
                
            }
            
            
        } failHandler: { httpStatusCode, errorMessage in
            print("Failed with code \(httpStatusCode) - \(errorMessage)")
        }
        
        print("After calling signin")
    
              
    }
    
}

