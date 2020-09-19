//
//  ViewController.swift
//  Jervin Test Project
//
//  Created by Jervin Cruz on 9/18/20.
//

import UIKit
import IterableSDK

class ViewController: UIViewController {
    
    let candidateEmailAddress : String = "jervincruz@icloud.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }

    // Update Profile Button
    @IBAction func updateUserProfile(_ sender: Any) {
        
        updateUserInfo()

        print("Holaaaa world!")
    }
    
    
    func updateUserInfo() {
        
        let dataField : [String:Any] = [
            "firstName" : "Jervin",
            "isRegisteredUser" : true,
            "SA_User_Test_Key" : "completed"
        ]
        
        //Call Iterable's updateUser
        IterableAPI.updateUser(dataField, mergeNestedObjects: false, onSuccess: myUserUpdateeSuccessHandler, onFailure: myUserUpdateFailureHandler)
        
    }
    
    //Returns if Iterable Call Successful
    func myUserUpdateeSuccessHandler(data:[AnyHashable:Any]?) -> () {
        // success
        print("sent to Iterable success!")
    }
    
    
    //Returns if Iterable Call Fails
    func myUserUpdateFailureHandler(reason:String?, data:Data?) -> () {
        // failure
        print("sent to Iterable failure")
    }
    
    // Send Custom Event Button
    @IBAction func sendCustomEvent(_ sender: Any) {
        
        let dataField : [String:Any] = [
            "platform" : "iOS",
            "isTestEvent" : true,
            "url" : "https://iterable.com/sa-test/Jervin",
            "secret_code_key" : "Code_123"
        ]
        
        IterableAPI.track(event: "mobileSATestEvent", dataFields: dataField)
        
    }
    
    

}

