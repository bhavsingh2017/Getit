//
//  ViewController.swift
//  Getit
//
//  Created by Bhav Singh on 11/6/18.
//  Copyright © 2018 AppDevs. All rights reserved.
//


import UIKit
import AWSAuthCore
import AWSAuthUI
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Added this.....
        
        /*
        UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
        backgroundImageView.image=backgroundImage;
         */
        
        showSignIn()
    }
    
    func showSignIn() {
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController
                .presentViewController(with: self.navigationController!,
                                       configuration: nil,
                                       completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                                        if error != nil {
                                            print("Error occurred: \(String(describing: error))")
                                        } else {
                                            // Sign in successful.
                                        }
                })
        }
    }


}

