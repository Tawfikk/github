//
//  GIthubAPI.swift
//  github
//
//  Created by Abdullah Tawfik on 19/02/2018.
//  Copyright © 2018 Abdullah Tawfik. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct GithubAPI {
    
    var basicURL: String = "https://api.github.com/repositories"
    
    func requestJSON(for url: URLConvertible, method: HTTPMethod, completionBlock: @escaping (JSON?, Error?) -> Void) {
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completionBlock(json, nil)
                case .failure(let error):
                    completionBlock(nil, error)
                }
        }
    }    
}





