//
//  ViewController.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var activityLabel: UILabel!
    var activityFetcher = ActivityFetcher.getInstance()
    var activityData : Activity = Activity()
    private let activityController = ActivityController.getInstance()
    
    //    Nothing Necessary here
    override func viewDidLoad() {
        super.viewDidLoad()
        activityLabel.text = ""
    }

//    Find an activity
    
    @IBAction func getActivity(_ sender: Any) {
        self.activityFetcher.fetchDataFromAPI()
        self.activityData = activityFetcher.activity
        activityLabel.text = activityData.activityName
    }
    
    @IBAction func addToFavourites(_ sender: Any){
        let newActivity = ActivityModel()
        if(!self.activityLabel.text!.isEmpty){
            newActivity.name = activityLabel.text!
            print(newActivity.name)
            activityController.insertActivity(new: newActivity)
        }
    }
    
    @IBAction func done(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle: Bundle.main)
        let activityView = storyboard.instantiateViewController(identifier: "ActivityView")
        performSegue(withIdentifier: "segue", sender: self)
    }
    
//    Mem warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

