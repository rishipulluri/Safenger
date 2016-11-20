//
//  LoginViewController.swift
//  Safenger
//
//  Created by Rishi Pulluri on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController  {
    
    let twitterConsumerKey = "2nkEy3wkbkFFvDcUCkuCYeIrn";
    let twitterConsumerSecret = "2nkEy3wkbkFFvDcUCkuCYeIrn2nkEy3wkbkFFvDcUCkuCYeIrn"
    let twitterBaseUrl = NSURL(string: "https://api.twitter.com")
    
    var oauthswift: OAuth1Swift?

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oauthswift = OAuth1Swift(
            consumerKey:    "2nkEy3wkbkFFvDcUCkuCYeIrn",
            consumerSecret: "rNEf4gA1GSniCr30PwtTeLYwsc58NEzcjVgC7qdwjJwqTjNa7H",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        let handle = oauthswift?.authorize(
            withCallbackURL: URL(string: "oauth-swift://oauth-callback/twitter")!,
            success: { credential, response, parameters in
                print(credential.oauthToken)
                print(parameters["user_id"])
                print("hehh")
            },
            failure: { error in
                print(error.localizedDescription)
                print("hber")
            }             
        )
        
       
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
