//
//  Jobs Model Controller.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

class JobsController {
    static let baseURL = URL(string: "https://jobs.github.com/positions")
    
    
    static func searchJobs(withDescription description: String, withLocation location: String, completion: @escaping (([Job]?)->Void)) {
        
        /// URL
        guard let url = baseURL?.appendingPathExtension("json") else {
            print("Error generating URL")
            completion(nil)
            return
        }
        ///Queries
        
        // Step 1 - Get URL Components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
    
        // Step 2 - Get array of query items
        var urlParameters = ["description": description,
                             "location": location]
        
        var queryItems = urlParameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        // Step 3 - Combine step1 and 2 aka set the components query items to equal our query array
        
         components?.queryItems = queryItems
        
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
                let jobs = try JSONDecoder().decode([Job].self, from: data)
                completion(jobs)
                return
                
            } catch let error {
                print("Error decoding into jobs: \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
}
