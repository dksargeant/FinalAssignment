//
//  TableView.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import UIKit

class TableView: UITableViewController {
    var activities:[Activities] = [Activities]()
    private let activityController = ActivityController.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAllActivities()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activities", for: indexPath) as! CellView
        if(indexPath.row < activities.count){
            cell.activityLabel.text = activities[indexPath.row].name
        }
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
//    Select Between Updating or Deleing Data
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row < self.activities.count{
                let alert = UIAlertController(title: "Selected Activity", message: "Would you like to delete this activity?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No", style: .cancel))
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {action in
                    self.deleteOrder(indexPath: indexPath)
                }))
                present(alert, animated: true, completion: nil)
            }
        }
    
//    Get all Activities
        private func fetchAllActivities(){
            if(self.activityController.getAllActivities() != nil){
                self.activities = self.activityController.getAllActivities()!
                print(activities)
                self.tableView.reloadData()
            }
            else{
                print("No data to pull")
            }
        }
        
//    Delete ActivityByID
        private func deleteOrder(indexPath:IndexPath){
            self.activityController.deleteActivityByID(id: self.activities[indexPath.row].id!)
            self.fetchAllActivities()
        }
}
