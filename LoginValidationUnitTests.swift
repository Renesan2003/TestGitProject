//
//  LoginValidationUnitTests.swift
//  TestGitProjectTests
//
//  Created by Shivendra Singh on 16/02/22.
//

import XCTest
@testable import TestGitProject

class LoginValidationUnitTests: XCTestCase
{

    func test_LoginValidation_with_EmptyString_Return_ValidationFailure() {
        
        // ARRANGE
        let valiadtion = LoginValidation()
        let request = LoginRequset(userEmail: "", UserPassword: "")
        
        // ACT
        let result = valiadtion.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "email or password cannot be empty")
    }
    
    func test_LoginValidation_With_EmptyEmail_Return_ValidationFailure(){
        
        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequset(userEmail: "", UserPassword: "test")
        
        // ACT
        let result = validation.validate(request: request)
        
        // ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNil(result.message)
        XCTAssertEqual(result.message, "email or password cannot be empty")
    }
}
