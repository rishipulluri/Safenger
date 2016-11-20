//
//  LoginViewController.swift
//  Safenger
//
//  Created by Rishi Pulluri on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController  {
    
    let twitterConsumerKey = "2nkEy3wkbkFFvDcUCkuCYeIrn";
    let twitterConsumerSecret = "2nkEy3wkbkFFvDcUCkuCYeIrn2nkEy3wkbkFFvDcUCkuCYeIrn"
    let twitterBaseUrl = NSURL(string: "https://api.twitter.com")
    let applicationDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applicationDelegate.dict_Country_Cities.addEntries(from: ["rishi" : "nice"])
        applicationDelegate.dict_Country_Cities.addEntries(from: ["raju" : "nice"])

        print(applicationDelegate.dict_Country_Cities)
        

        
    }

    @IBAction func loginTwitter(_ sender: AnyObject) {

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
