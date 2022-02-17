//
//  LoginApiResource.swift
//  TestGitProject
//
//  Created by Shivendra Singh on 15/02/22.
//

import Foundation

struct LoginApiResource {
     
    func authenticateUser(request: LoginRequset, completionHandler: @escaping(_ result: LoginResponse?)->()) {

        let urlRequest = generateLoginUrlRequset(request: request)
        
        URLSession.shared.dataTask(with: urlRequest) { (responseData, serverResponse, serverError) in
            if(serverError == nil && responseData != nil){
                do {
                    let result = try JSONDecoder().decode(LoginResponse.self, from: responseData!)
                    completionHandler(result)
                } catch  {
                    debugPrint("Encoding request body failed")
                }
            }
        }.resume()
    }
    
    private func generateLoginUrlRequset(request: LoginRequset) -> URLRequest {
        
        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/")!)
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch{
            debugPrint("Encoding request body failed")
        }
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
}

