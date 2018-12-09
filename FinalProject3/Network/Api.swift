//
//  Api.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import UIKit

class Api {
    
    struct HttpMethod {
        static let get = "GET"
        static let post = "POST"
    }
    
    struct HttpHeader {
        static let authorization = "Authorization"
    }
    
    typealias Parameters = [String: Any?]
    typealias SuccessHandler<T> = ((T) -> Void)
    typealias ErrorHandler = ((String?) -> Void)

    
    let baseURL = "http://localhost:3000/finalproject3/api"
}
