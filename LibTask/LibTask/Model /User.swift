//
//  User.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import Foundation

struct UserSession: Decodable {
    var admin: String
    var username: String
}

struct User: Decodable {
    var id: String
    var firstname: String
    var lastname: String
    var birthdate: String?
    var username: String?
    var password: String?
    
    private func creatUserName(firstName: String, lastName: String) -> String {
        var userName: String = ""
        
        return userName
    }
    
    private func creatPassword(firstName: String, lastName: String, birthDate: String) -> String {
        var password: String = ""
        
        return password
    }
}
