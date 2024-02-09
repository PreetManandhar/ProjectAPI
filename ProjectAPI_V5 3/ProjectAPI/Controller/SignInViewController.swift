//
//  SignInViewController.swift
//  ProjectAPI
//
//  Created by english on 2023-11-14.
//

import UIKit

class SignInViewController: UIViewController {

   
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
    
    
    @IBAction func btnSignInTouchUpInside(_ sender: Any) {
        
        // Check for empty username

        guard let username = txtUsername.text, !username.isEmpty else {
            
            Toast.ok(view: self, title: "Sign in Failed", message: "Username cannot be empty")
            
            return
        }
                //for empty password
                guard let password = txtPassword.text, !password.isEmpty else {

                    Toast.ok(view: self, title: "Signin Failed", message: "Password cannot be empty")

                    return

                }


                // Check if username is already taken

            if UserProvider.allUsers.contains(where: { $0.username?.lowercased() == username.lowercased() }) {

                    Toast.ok(view: self, title: "Signin Failed", message: "Username is already taken")

                    return

                }

                

            let newUser = User(username: username, password: password)

            print("New user created: \(newUser)")

            UserProvider.allUsers.append(newUser)

            print("All users now: \(UserProvider.allUsers)")



                

                // Display success message

            Toast.ok(view: self, title: "Signin Successful", message: "You can now log in with your new credentials") { alertAction in

                
                  self.navigationController?.popViewController(animated: true)

             


            }
    }
    

}
