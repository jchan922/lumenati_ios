//
//  LogInViewController
//  lumenati
//
//  Created by Justin Chan on 12/20/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController {
    ////////////////////////////////////////////////////////////
    // MARK: - VARIABLES
    ////////////////////////////////////////////////////////////
    
    
    ////////////////////////////////////////////////////////////
    // MARK: - OUTLETS
    ////////////////////////////////////////////////////////////
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func submitButton(_ sender: UIButton) {
        self.loginViewToMapView()
    }
    
    ////////////////////////////////////////////////////////////
    // MARK: - DELEGATE PROTOCOLS
    ////////////////////////////////////////////////////////////

    
    
    //////////////////////////////////////////////////////
    // MARK: - HELPER FUNCTION
    //////////////////////////////////////////////////////
    func loginViewToMapView() {
        
        let loginForm: [String: AnyObject] = [
            "username": self.usernameTextField.text as AnyObject,
            "password": self.passwordTextField.text as AnyObject
        ]
        
        Alamofire.request("http://localhost:8000/login", method: .post, parameters: loginForm, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            // Set response data
            let apiDataResponse = response.result.value as? NSDictionary
            
            var idSave = "n/a"
            var first_nameSave = "n/a"
            var last_nameSave = "n/a"
            var usernameSave = "n/a"
            var emailSave = "n/a"
            var groupSave = [NSDictionary]()
            var markerSave = [NSDictionary]()

            if let id = apiDataResponse?["_id"] {
                idSave = id as! String
            }
            if let first_name = apiDataResponse?["first_name"] {
                first_nameSave = first_name as! String
            }
            if let last_name = apiDataResponse?["last_name"] {
                last_nameSave = last_name as! String
            }
            if let username = apiDataResponse?["username"] {
                usernameSave = username as! String
            }
            if let email = apiDataResponse?["email"] {
                emailSave = email as! String
            }
            if let group = apiDataResponse?["groups"] {
                groupSave = group as! [NSDictionary]
            }
            if let marker = apiDataResponse?["markers"] {
                markerSave = marker as! [NSDictionary]
            }
            
            let sessionUser = User(_id: idSave, first_name: first_nameSave, last_name: last_nameSave, username: usernameSave, email: emailSave, groups: groupSave, markers: markerSave)
            
            // Instantiate appDel and homeScreen constants
            let appDel = (UIApplication.shared).delegate as! AppDelegate
            // Set session user data
            appDel.sessionUser = sessionUser
            let mapView = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
            // Setting some data
            mapView.sessionUser = sessionUser
            // Call method in AppDelegate.swift to transition to the Home View Controller
            appDel.moveToVC(mainScreen: mapView)
        }
    
    }
    
    
    
    
    ////////////////////////////////////////////////////////////
    // MARK: - UI LIFE CYCLE
    ////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    
}


/* 
 
 var markerIdSave = "n/a"
 var markerTitleSave = "n/a"
 var markerAddressSave = "n/a"
 var markerCategorySave = "n/a"
 var markerDescriptionSave = "n/a"
 var markerUrlSave = "n/a"
 var markerLatitudeSave = "n/a"
 var markerLongitudeSave = "n/a"
 var markerCreator = "n/a"
 
 if let id = temp["_id"] {
 idSave = id as! String
 }
 
 */
