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
    var messageObjects: NSArray?
    let applicationDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var profileImageToPass: UIImage!
    var usernameToPass: String!

    // Instance variables
    let tableViewRowHeight: CGFloat = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileImageView.backgroundColor = UIColor.clear
        ProfileImageView.layer.cornerRadius = 15
        ProfileImageView.layer.borderWidth = 1
        ProfileImageView.layer.borderColor = UIColor.blue.cgColor
        
        let requestURL: NSURL = NSURL(string: "https://safenger-pjemrogysl.now.sh/")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSDictionary
                    
                    self.messageObjects = (json["messages"]) as? NSArray
                    
                    self.tableView.reloadData()

                    
                }
                catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        task.resume()


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
        var object = 4
        if let object1 = messageObjects?.count
        {
             object = (messageObjects?.count)! as Int
        }
        
          potentialHarassmentsLabel.text = "\(object) Potential Harassments"
        if (messageObjects != nil && segmentedControl.selectedSegmentIndex == 0) {
            return (messageObjects?.count)!

        }
        else if (applicationDelegate.dict_Country_Cities1["Names"] != nil && segmentedControl.selectedSegmentIndex == 1){
            let const = applicationDelegate.dict_Country_Cities1["Names"] as! [String]
            print(const)
            return const.count
        }
        print(applicationDelegate.dict_Country_Cities1["Names"])
        let users =  applicationDelegate.dict_Country_Cities1["Names"] as! [String]
        safeUsersLabel.text = "\(users.count) Safe Users"
      

        return 0;
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
        let rowNumber: Int = (indexPath as NSIndexPath).row
        let objectmessage = messageObjects?[rowNumber] as! [String:AnyObject]
        if (segmentedControl.selectedSegmentIndex == 0) {
            

            let objectmessage = messageObjects?[rowNumber] as! [String:AnyObject]
            cell.nameLabel.text = objectmessage["sender"] as! String?
            cell.messageLabel.text = objectmessage["message"] as! String?
            
            let url = URL(string: objectmessage["img"] as! String)
            let data = try? Data(contentsOf: url!)
            cell.profileImageView.image = UIImage(data: data!)
            
            profileImageToPass = cell.profileImageView.image!
            usernameToPass = cell.nameLabel.text
        } else {
            
            
            var index = 0
            
            let count = (messageObjects?.count)! as Int
            
            let person = applicationDelegate.dict_Country_Cities1["Names"] as! [String]
            cell.nameLabel.text = person[rowNumber]
            
            for i in 0...count-1 {
                var x = messageObjects?[i] as! [String:AnyObject]

                if (x["sender"] as! String == person[rowNumber]) {
                    index = i;
                }
            }
            let objectmessage = messageObjects?[index] as! [String:AnyObject]

            cell.messageLabel.text = objectmessage["message"] as! String?

        }
        
    
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
        
        if (segmentedControl.selectedSegmentIndex == 0) {
            performSegue(withIdentifier: "ShowHarassment", sender: self)
        } else {
            performSegue(withIdentifier: "ShowUser", sender: self)
        }
    }
    
    @IBAction func segmentPressed(_ sender: AnyObject) {
        tableView.reloadData()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowUser" {
            
            // Obtain the object reference of the destination view controller
            let safeUserViewController: SafeUserViewController = segue.destination as! SafeUserViewController
            
            //Pass the data object to the destination view controller object
            safeUserViewController.profileImagePassed = profileImageToPass
            safeUserViewController.usernamePassed = usernameToPass
        }
    }
}
