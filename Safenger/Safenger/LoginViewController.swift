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
        loginButton.readPermissions = ["read_mailbox"]
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: view.frame.height/2, width: view.frame.width - 32, height: 50)
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.current() {
            print(token.tokenString)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func fetchProfile() {
        print("fetch profile")
        let profileEndpoints = ["fields":"email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: profileEndpoints).start {(connection, result, error) -> Void in
            var result = result as! NSDictionary

            if (error != nil) {
                
                print(error)
            }
            
            
           
            if let first_name = result["first_name"] as? String {
                print(first_name)
            }
            if let last_name = result["last_name"] as? String {
                print(last_name)
            }
            if let picture = result["picture"] as? NSDictionary {
                if let data = picture["data"] as? NSDictionary {
                    if let url = data["url"] as? String {
                        print(url)
                    }
                }
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PotentialHarassmentViewController") as! PotentialHarassmentViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        }
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        if (error != nil) {
            print(error)
            return

        }
        fetchProfile()

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
