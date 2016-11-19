//
//  LoginViewController.swift
//  Safenger
//
//  Created by Rishi Pulluri on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: view.frame.height/2, width: view.frame.width - 32, height: 50)
        loginButton.delegate = self
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        if (error != nil) {
            print(error)
            return
        }
        performSegue(withIdentifier: "loginSegue", sender: self)
        print("Logged in successfully")
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
