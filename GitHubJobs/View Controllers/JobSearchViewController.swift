//
//  JobSearchViewController.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class JobSearchViewController: UIViewController {
    
    @IBOutlet weak var jobDescriptionTextField: UITextField!
    @IBOutlet weak var jobLocationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Button to trigger list navigation or NoJobs alert
    
    @IBAction func jobSearchButtonTapped(_ sender: Any) {
        guard let jobDescription = jobDescriptionTextField.text, !jobDescription.isEmpty,
            let jobLocation = jobLocationTextField.text else {
                return
        }
        
        JobsController.searchJobs(withDescription: jobDescription, withLocation: jobLocation) { (jobs) in
            
            guard let jobs = jobs, !jobs.isEmpty else {
                
                let noJobsAlert = UIAlertController(title: nil, message: "No Jobs At All", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAlert = UIAlertAction(title: "*sigh*", style: .cancel, handler: nil)
                noJobsAlert.addAction(cancelAlert)
                DispatchQueue.main.async {
                    self.present(noJobsAlert, animated: true, completion: nil)
                }
                return
            }

            DispatchQueue.main.async {
                self.navigationController?.pushViewController(JobListViewController.makeFromStoryboard(jobs: jobs), animated: true)
            }
        }
    }
}
