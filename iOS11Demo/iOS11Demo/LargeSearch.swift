//
//  LargeSearch.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/28.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit

class LargeSearch: UITableViewController {
    
    var contents = [
        "Session 245 Building Apps with Dynamic Type Apple continues to push hard for developers to support dynamic type. A big change in iOS 11 is that all styles now grow with the extra large accessibility sizes (in the past only the body style did). Apple has also made it easier to support with custom fonts using UIFontMetrics. A PDF vector asset in the asset catalog can now be set to preserve vector data.",
        "Session 219 Modern User Interaction on iOS Apple may not be encouraging it but you can now intercept the system swipes at the edges of the screen before they trigger the control center, notifications or slide over actions.",
        "abdcdefg",
        "Nothing"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"
        let uisearchController = UISearchController(searchResultsController: nil)
        
        self.navigationItem.searchController = uisearchController
        
        self.refreshControl = UIRefreshControl()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.separatorInsetReference = .fromCellEdges
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DemoCell
        
        cell.titleLabel.text = self.contents[indexPath.row % 4]
     
        return cell
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
