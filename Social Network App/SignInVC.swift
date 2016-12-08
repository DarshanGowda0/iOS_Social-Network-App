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
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    

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
    
    @IBAction func singInButtonTapped(_ sender: Any) {
        
        if let email = emailField.text,let pwd = pwdField.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error != nil{
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil{
                            print("sign in with email failed")
                        }else{
                            print("signed in succesfully")
                        }
                    })
                }else{
                    print("succesfully signed in")
                }
            })
        }
    }
    
}

