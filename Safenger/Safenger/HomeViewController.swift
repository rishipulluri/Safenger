//
//  HomeViewController.swift
//  Safenger
//
//  Created by Sean Crenshaw on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ProfileImageView: UIImageView!
    @IBOutlet var safeUsersLabel: UILabel!
    @IBOutlet var potentialHarassmentsLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!

    // Instance variables
    let tableViewRowHeight: CGFloat = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
     --------------------------------------
     MARK: - Table View Data Source Methods
     --------------------------------------
     */
    
    // Asks the data source to return the number of sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    // Asks the data source to return the number of rows in a section, the number of which is given
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3// arrayOfMovieDictionaries.count
    }
    
    /*
     ------------------------------------
     Prepare and Return a Table View Cell
     ------------------------------------
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let rowNumber: Int = (indexPath as NSIndexPath).row // Identify the row number
        
        // Obtain the object reference of a reusable table view cell object instantiated under the identifier
        // MovieCell, which was specified in the storyboard
        let cell: DataTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataTableViewCell
        
        // Obtain the Dictionary containing the data about the movie at rowNumber
        // let movieDataDict = arrayOfMovieDictionaries[rowNumber] as! Dictionary<String, AnyObject>
        
        return cell
    }
    
    /*
     -----------------------------------
     MARK: - Table View Delegate Methods
     -----------------------------------
     */
    
    // Asks the table view delegate to return the height of a given row.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableViewRowHeight
    }
    
    // Informs the table view delegate that the specified row is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let rowNumber: Int = (indexPath as NSIndexPath).row // Identify the row number
        
        // Obtain the Dictionary containing the data about the selected movie to pass to the downstream view controller
        // movieDataToPass = arrayOfMovieDictionaries[rowNumber] as! Dictionary<String, AnyObject>
        
        // print(movieDataToPass)
        
        performSegue(withIdentifier: "MovieInfo", sender: self)
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