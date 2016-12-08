//
//  ViewController.swift
//  Social Network App
//
//  Created by Darshan Gowda on 07/12/16.
//  Copyright © 2016 Darshan Gowda. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookButtonTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) {(result,error) in
            if let err = error{
                print("Error in facebook auth \(err)")
            }else if (result?.isCancelled)!{
                print("user cancelled the auth")
            }else{
                print("login successfull")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential: credential)
            }
        }
        
    }
    
    func firebaseAuth(credential : FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: { (result, error) in
            
            if let err = error{
                print("error in firebase auth \(err)")
            }else{
                print("succesfully signed in using firebase")
            }
            
        })
    }
}

