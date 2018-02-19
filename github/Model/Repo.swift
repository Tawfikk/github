//
//  Repo.swift
//  github
//
//  Created by Abdullah Tawfik on 19/02/2018.
//  Copyright © 2018 Abdullah Tawfik. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Repo {
    let id: Int
    let name: String
    let author: String
    let repoUrl: String
    let description: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        author = json["owner"]["login"].stringValue
        repoUrl = json["html_url"].stringValue
        description = json["description"].stringValue
    }
}
