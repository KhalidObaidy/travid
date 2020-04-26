//
//  ProfileData.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import Foundation


struct ProfileData {
    
    
    
    
    let DateOfBirth: String!
    let Email: String!
    let FullName: String!
    let IDCard: String!
    let Nationality: String!
    let sex: String!
    
    
    
    init(DateOfBirth: String, Email: String, FullName: String, IDCard: String, Nationality: String, sex: String){
        
        
        self.DateOfBirth = DateOfBirth
        self.Email = Email
        self.FullName = FullName
        self.IDCard = IDCard
        self.Nationality = Nationality
        self.sex = sex
        
        
    }
    
    
}
