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
    let twitterConsumerSecret = "rNEf4gA1GSniCr30PwtTeLYwsc58NEzcjVgC7qdwjJwqTjNa7H"
    let twitterBaseUrl = NSURL(string: "https://api.twitter.com")
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
