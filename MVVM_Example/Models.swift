//
//  Models.swift
//  MVVM_Example
//
//  Created by Akanksha pakhale on 15/09/21.
//

import Foundation
enum Gender {
    case male, female, unspecified
}
 
struct Person {
    var name:String?
    var birthDate: Date?
    var middlename: String?
    var address: String?
    var gender: Gender
    
    var username = "Kerry john"
    
    init(name: String,
         birthDate: Date? = nil,
         middlename: String? = nil,
         address: String? = nil,
         gender: Gender = .unspecified)
    {
        self.name = name
        self.birthDate = birthDate
        self.middlename = middlename
        self.address = address
        self.gender = gender
    }
    
    
    }
