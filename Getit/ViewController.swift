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

    var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Added this.....
        
        //initialize the view here
        headerView = UIView()
        headerView.backgroundColor = .red
        self.view.addSubview(headerView)
        
        //need to change the button layout so that it works for every type of screen
        
        /*
        let buttonForHost = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        buttonForHost.backgroundColor = .green
        buttonForHost.setTitle("I'M LOOKING FOR AN EVENT", for: .normal)
        let buttonForAttender = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
        buttonForAttender.backgroundColor = .green
        buttonForAttender.setTitle("I WANT TO HOST AN EVENT", for: .normal)
        
        buttonForAttender.addTarget(self, action: #selector(showSignIn), for: .touchUpInside)
        buttonForHost.addTarget(self, action: #selector(showSignIn), for: .touchUpInside)
        */
        
        
        let MenuImageName = "the-youtube-logo-3238901_640.png"
        let SelectedImageName = "drunkGiraffe.jpg"
        
        let image1 = UIImage(named: MenuImageName)
        //let image2 = UIImage(named: SelectedImageName)
        
        
        
        let xSizeMid = UIScreen.main.bounds.width/2-(image1!.size.width/2)
        let ySizeMid = UIScreen.main.bounds.height/2-(image1!.size.height/2)
        
        //adding the new menu option right here
        let button = CircleMenu(
            frame: CGRect(x: xSizeMid, y: ySizeMid, width: 50, height: 50),
            normalIcon:MenuImageName,
            selectedIcon:SelectedImageName,
            buttonsCount: 4,
            duration: 1.5,
            distance: 140)
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        button.subButtonsRadius = 30
        //button.addTarget(self, action: #selector(showSignIn), for: .touchUpInside)
        self.view.addSubview(button)

        //self.view.addSubviewbuttonForAttender)
        //self.view.addSubview(buttonForHost)
        
        //showSignIn()
    }
    
    
    @objc func showSignIn(sender: UIButton!) {
        
        print("Hit the button!")
        print("****************Trying to log in!*******************")
        print("Running showSignIn")
    
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!,configuration: nil,
            completionHandler: { (provider: AWSSignInProvider, error: Error?) in
            if error != nil {
                print("Error occurred: \(String(describing: error))")
            } else {
                // Sign in successful.
                print("Sign in was successfull!")
            }
        })
        }
    }


}

