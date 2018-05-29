//
//  JobSearchViewController.swift
//  GitHubJobs
//
//  Created by Ben Adams on 5/28/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import UIKit

class JobSearchViewController: UIViewController {
    @IBOutlet weak var jobLocationTextField: UITextField!
    @IBOutlet weak var jobDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        let jobDescription = jobDescriptionTextField.text
        let jobLocation = jobLocationTextField.text
        return
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
