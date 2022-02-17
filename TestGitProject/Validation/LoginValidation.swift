//
//  LoginValidation.swift
//  TestGitProject
//
//  Created by Shivendra Singh on 15/02/22.
//

import Foundation

struct LoginValidation {
    func validate(request: LoginRequset) -> ValidationResponse
    {
        guard !request.userEmail.isEmpty && !request.UserPassword.isEmpty else {
            
            return ValidationResponse(message: "email or password cannot be empty", isValid: false)
        }
        
        guard request.userEmail.isValidEmail() else {
            
            return ValidationResponse(message: "email id is invalid", isValid: false)
        }
        
        return ValidationResponse(message: nil, isValid: true)
    }
    
}






