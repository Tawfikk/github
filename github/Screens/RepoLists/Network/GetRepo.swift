//
//  GetRepo.swift
//  github
//
//  Created by Abdullah Tawfik on 19/02/2018.
//  Copyright © 2018 Abdullah Tawfik. All rights reserved.
//

import Foundation
import Alamofire

class GetRepo {
    
    static let basicURL: String = "https://api.github.com/repositories"
    
    func getRepo(url: String, completion: @escaping (([Repo]) -> Void)) {
        GithubAPI.shared.requestJSON(for: url, method: .get) { (json, error) in
            guard error == nil else {
                print("Error")
                return
            }
            
            var repos: [Repo] = []
            guard let repoData = json else { return }
            for data in repoData.arrayValue {
                let repo = Repo(json: data)
                repos.append(repo)
            }
            completion(repos)
        }
    }
}
