//
//  TwitterClient.swift
//  Safenger
//
//  Created by Rishi Pulluri on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//


import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "2nkEy3wkbkFFvDcUCkuCYeIrn";
let twitterConsumerSecret = "rNEf4gA1GSniCr30PwtTeLYwsc58NEzcjVgC7qdwjJwqTjNa7H"
let twitterBaseUrl = NSURL(string: "https://api.twitter.com")



class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance:TwitterClient {
        struct Static {
            static let instance =     TwitterClient(baseURL: twitterBaseUrl as URL!, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance!
    }
}
