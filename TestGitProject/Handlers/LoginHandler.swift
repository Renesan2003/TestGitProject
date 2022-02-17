//
//  LoginHandler.swift
//  TestGitProject
//
//  Created by Shivendra Singh on 15/02/22.
//

import Foundation

struct LoginHandler {
    
    private let validation = LoginValidation()
    private let loginApiResource = LoginApiResource()
    
    func authenticateUser(request: LoginRequset, completionHandler: @escaping(_ loginData: LoginData?)-> ()) {
        let validationResult = validation.validate(request: request)
        if (validationResult.isValid){
            loginApiResource.authenticateUser(request: request){(response) in
                completionHandler(LoginData(errorMessage: nil, response: response))
            }
        }
        completionHandler(LoginData(errorMessage: validationResult.message, response: nil))
    }
}

//struct LoginHandler {
//
//    private let validation = LoginValidation()
//    private let loginApiResource = LoginApiResource()
//
//    func authenticateUser(request: LoginRequest, completionHandler: @escaping(_ loginData: LoginData?)->()) {
//        let validationResult = validation.validate(request: request)
//        if(validationResult.isValid) {
//            loginApiResource.authenticateUser(request: request) { (response) in
//                // return it back to the caller
//                completionHandler(LoginData(errorMessage: nil, response: response))
//            }
//        }
//        completionHandler(LoginData(errorMessage: validationResult.message, response: nil))
//    }
//}
