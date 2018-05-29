//
//  Jobs Model.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

struct Jobs: Codable {
    let results: [JobListing]
}

struct JobListing: Codable {
    let title: String?
    let location: String?
    let company: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case location
        case company
    }
}