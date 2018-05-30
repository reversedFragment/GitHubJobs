//
//  Jobs Model.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

struct Job: Codable {
    var title: String
    var location: String
    var description: String
    var company: String
    var url: String
}



