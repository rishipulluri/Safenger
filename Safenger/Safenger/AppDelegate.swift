//
//  AppDelegate.swift
//  Safenger
//
//  Created by Sean Crenshaw on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dict_users: NSMutableDictionary = NSMutableDictionary()
    var dict_Country_Cities: NSMutableDictionary = NSMutableDictionary()
    var dict_Country_Cities1: NSMutableDictionary = NSMutableDictionary()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectoryPath = paths[0] as String
        
        let plistFilePathInDocumentDirectory = documentDirectoryPath + "/messages"
        
        let plistFilePathInDocumentDirectory1 = documentDirectoryPath + "/safeUsers"
        
        let dictionaryFromFile: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInDocumentDirectory)
        
        let dictionaryFromFile1:NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInDocumentDirectory1)
        
        
        if let dictionaryFromFileInDocumentDirectory = dictionaryFromFile {
            
            // CountryCities.plist exists in the Document directory
            dict_Country_Cities = dictionaryFromFileInDocumentDirectory
            
        } else {
            
            
            let plistFilePathInMainBundle = Bundle.main.path(forResource: "messages", ofType: "plist")
            
            
            let dictionaryFromFileInMainBundle: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInMainBundle!)
            
            dict_Country_Cities = dictionaryFromFileInMainBundle!
        }
        
        if let dictionaryFromFileInDocumentDirectory = dictionaryFromFile1 {
            
            // CountryCities.plist exists in the Document directory
            dict_Country_Cities1 = dictionaryFromFileInDocumentDirectory
            
        } else {
            
            
            let plistFilePathInMainBundle = Bundle.main.path(forResource: "safeUsers", ofType: "plist")
            
            
            let dictionaryFromFileInMainBundle: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInMainBundle!)
            
            dict_Country_Cities1 = dictionaryFromFileInMainBundle!
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectoryPath = paths[0] as String
        
        let plistFilePathInDocumentDirectory = documentDirectoryPath + "/messages"
        
        let plistFilePathInDocumentDirectory1 = documentDirectoryPath + "/safeUsers"
        
        dict_Country_Cities.write(toFile: plistFilePathInDocumentDirectory, atomically: true)
        
        dict_Country_Cities1.write(toFile: plistFilePathInDocumentDirectory1, atomically: true)
        

        
    }


    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

