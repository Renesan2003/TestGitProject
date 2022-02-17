//
//  LoginResponse.swift
//  TestGitProject
//
//  Created by Shivendra Singh on 15/02/22.
//

import Foundation
//import XCTest

struct LoginResponse: Decodable
{
    let errorMessage : String?
    let data : LoginResponseData?
}

struct LoginResponseData : Decodable {
    
    let userName : String
    let userID : Int
    let email : String
    
    enum coadingKeys: String , CodingKey
    {
        case userName
        case userID = "userId"
        case email
    }
}
