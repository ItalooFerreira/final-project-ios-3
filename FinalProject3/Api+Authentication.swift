//
//  Api+Authentication.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import Foundation

extension Api {
    
    fileprivate struct EndPoint {
        static let pathLogin = "/login"
    }
    
    func login(parameters: Parameters, successHandler: @escaping SuccessHandler<User>, failureHandler: @escaping ErrorHandler )  {
        guard let url = URL(string: baseURL + EndPoint.pathLogin) else { failureHandler("unsupported URL"); return }
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.post
        
        if let username = parameters["username"] as? String, let password = parameters["password"] as? String {
            if let authorizationToken = String(format: "%@:%@", username, password).data(using: .utf8)?.base64EncodedString() {
                request.addValue(authorizationToken, forHTTPHeaderField: HttpHeader.authorization)
            }
        }
        
        let session = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data, error == nil else {
                failureHandler(error?.localizedDescription)
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                successHandler(user)
            } catch let error {
                failureHandler(error.localizedDescription)
            }
        }
        
        session.resume()
    }
}
