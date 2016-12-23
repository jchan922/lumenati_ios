//
//  MapViewController.swift
//  lumenati
//
//  Created by Justin Chan on 12/21/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import UIKit
import Alamofire
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, CancelButtonDelegate, UITableViewDelegate, UITableViewDataSource {

    ////////////////////////////////////////////////////////////
    // MARK: - VARIABLES
    ////////////////////////////////////////////////////////////
    var sessionUser: User?
    var sideTableViewFlag:Bool?
    var bottomTableViewFlag:Bool?
    var groups = [Group]()
    var markers = [Marker]()
    
    ////////////////////////////////////////////////////////////
    // MARK: - OUTLETS
    ////////////////////////////////////////////////////////////

    
    // For Table View Cells
        
    // For Animations
    @IBOutlet weak var sideTableView: UITableView!
    @IBOutlet weak var sideTableLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet weak var bottomTableBottomConstraint: NSLayoutConstraint!
    
    
    
    @IBAction func handleGroupButtonPressed(_ sender: Any) {
        if self.sideTableViewFlag! {
            self.sideTableLeadingConstraint.constant = 0
            self.sideTableViewFlag = false
        } else {
            self.sideTableLeadingConstraint.constant = -500
            self.sideTableViewFlag = true
        }
    
        // Code to start animation
        self.view.setNeedsLayout() // layout will change and update UI
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [UIViewAnimationOptions.allowUserInteraction], animations: {
            
            // During the animation
            self.view.layoutIfNeeded()
            
            
        }) { (finished) in
            if finished{
                
                // do stuff after animation is finished
            }
        
        }
        
    }

    @IBAction func handleListButtonPressed(_ sender: Any) {
        if self.bottomTableViewFlag! {
            self.bottomTableBottomConstraint.constant = 0
            self.bottomTableViewFlag = false
        } else {
            self.bottomTableBottomConstraint.constant = -300
            self.bottomTableViewFlag = true
        }
        
        // Code to start animation
        self.view.setNeedsLayout() // layout will change and update UI
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [UIViewAnimationOptions.allowUserInteraction], animations: {
            
            // During the animation
            self.view.layoutIfNeeded()
            
            
        }) { (finished) in
            if finished{
                
                // do stuff after animation is finished
            }
            
        }
        
    }
    

    
    ////////////////////////////////////////////////////////////
    // MARK: - DELEGATE PROTOCOLS
    ////////////////////////////////////////////////////////////
    
    // Cancel Button Delegate Protocol
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    ////////////////////////////////////////////////////////////
    // MARK: - UI LIFE CYCLE
    ////////////////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideTableLeadingConstraint.constant = -500
        self.bottomTableBottomConstraint.constant = -300
        self.sideTableViewFlag = true
        self.bottomTableViewFlag = true
        
        
        if (self.sessionUser != nil) {
            
            for var i in 0...((sessionUser?.groups)?.count)!-1 {
                let group = (sessionUser?.groups)?[i]
                var idSave = "n/a"
                var nameSave = "n/a"
                
                if let id = group?["_id"] {
                    idSave = id as! String
                }
                if let name = group?["name"] {
                    nameSave = name as! String
                }
                self.groups.append(Group(_id: idSave, name: nameSave))
            }
            
            for var i in 0...((sessionUser?.markers)?.count)!-1 {
                let marker = (sessionUser?.markers)?[i]
                var idSave = "n/a"
                var titleSave = "n/a"
                var addressSave = "n/a"
                var categorySave = "n/a"
                var descriptionSave = "n/a"
                var urlSave = "n/a"
                var latitudeSave = 0.0
                var longitudeSave = 0.0
                
                
                if let id = marker?["_id"] {
                    idSave = id as! String
                }
                if let title = marker?["title"] {
                    titleSave = title as! String
                }
                if let address = marker?["address"] {
                    addressSave = address as! String
                }
                if let category = marker?["category"] {
                    categorySave = category as! String
                }
                if let marker = marker?["marker"] {
                    descriptionSave = marker as! String
                }
                if let url = marker?["url"] {
                    urlSave = url as! String
                }
                if let latitude = marker?["latitude"] {
                    latitudeSave = Double(Int(latitude as! Float))
                }
                if let longitude = marker?["longitude"] {
                    longitudeSave = Double(longitude as! Float)
                }
                
                self.markers.append(Marker(_id: idSave, title: titleSave, address: addressSave, category: categorySave, description: descriptionSave, url: urlSave, latitude: Float(latitudeSave), longitude: Float(longitudeSave)))
            }
        } else {
            print("No session user")
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    ////////////////////////////////////////////////////////////
    // MARK: - TABLE VIEW PROTOCOLS
    ////////////////////////////////////////////////////////////
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.sideTableView {
           return self.groups.count
        } else if tableView == self.bottomTableView {
            return self.markers.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.sideTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as! CustomGroupTableViewCell
            cell.model = self.groups[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "markersListCell") as! CustomMarkerTableViewCell
            cell.model = self.markers[indexPath.row]
            return cell
        }
    }
    
}
