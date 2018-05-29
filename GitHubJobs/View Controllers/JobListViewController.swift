//
//  JobListViewController.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class JobListViewController: UIViewController {
    
    var jobs = [Job]()
    
    static func makeFromStoryboard(jobs: [Job]) -> JobListViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JobListViewController") as? JobListViewController ?? JobListViewController()
        vc.jobs = jobs
        return vc
    }

    // MARK: -
    // Constants
    struct Constants {
        static let jobCellID = "jobCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }


}
