//
//  UserModel.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 25/10/23.
//


import Foundation

class User {
    
    var username : String?
    
    var password : String?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}
