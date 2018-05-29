//
//  Jobs Model Controller.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

class JobsController {
    static let baseURL = URL(string: "https://jobs.github.com/")
    
    
    static func searchJobs(fortitle title: String, location: String, completion: @escaping (([JobListing]?) -> Void)) {
        
        /// URL
        guard var url = baseURL else { completion(nil) ; return }
        url.appendPathComponent("positions.json")
        
        ///Queries
        
        // Step 1 - Get URL Components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
    
        // Step 2 - Get array of query items
        let titleQuery = URLQueryItem.init(name: "title", value: title)
        let locationQuery = URLQueryItem.init(name: "location", value: location)
        
        // Step 3 - Combine step1 and 2 aka set the components query items to equal our query array
        let queryArray = [titleQuery, locationQuery]
         components?.queryItems = queryArray
        
        // Step 4 - Create fully constructed URL
        guard let finalUrl = components?.url else { completion(nil) ; return }
        print("📡📡📡  \(finalUrl.absoluteString)   📡📡📡")
        
        /// Request
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        /// DataTask
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil) ; return }
            
            do {
                let jobs = try? JSONDecoder().decode(Jobs.self, from: data)
                let joblistings = jobs?.results
                completion(joblistings)
                return
                
            } catch {
                print("Error decoding joblistings: \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
}
