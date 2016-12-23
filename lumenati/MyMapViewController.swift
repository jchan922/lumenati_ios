//
//  MyMapViewController.swift
//  lumenati
//
//  Created by Justin Chan on 12/22/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire

class MyMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    ////////////////////////////////////////////////////////////
    // MARK: - VARIABLES
    ////////////////////////////////////////////////////////////
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var long: Double?
    var lat: Double?
    
    
    ////////////////////////////////////////////////////////////
    // MARK: - OUTLETS
    ////////////////////////////////////////////////////////////

   
    
    
    
    ////////////////////////////////////////////////////////////
    // MARK: - UI LIFE CYCLE
    ////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Initialize Google Maps
        let camera = GMSCameraPosition.camera(withLatitude: 34.180835, longitude: -118.309180, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(34.180835, -118.309180)
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.icon = GMSMarker.markerImage(with: .blue)
        marker.map = mapView
        view = mapView
        
        // If user is in session drop all user markers from DB
        Alamofire.request("http://localhost:8000/marker/show/all", method: .get).responseJSON { response in
            // Set response data
            let apiDataResponse = response.result.value as? NSDictionary
            
            if ((apiDataResponse?["markers"]) != nil) {
                let userMarkers = apiDataResponse?["markers"] as! NSArray
                // Loop through all markers
                for i in 0...userMarkers.count-1 {
                    let temp = userMarkers[i] as! NSDictionary
                    let id = temp["_id"] as! String
                    let title = temp["title"] as! String
                    let address = temp["address"] as! String
                    let category = temp["category"] as! String
                    let description = temp["description"] as! String
                    let url = temp["url"] as! String
                    let latitude = temp["latitude"] as! Float
                    let longitude = temp["longitude"] as! Float
                    
                    // Create a marker instance
                    let position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
                    let marker = GMSMarker(position: position)
                    marker.title = "\(title)"
                    marker.snippet =  "\(category)"
                    marker.appearAnimation = kGMSMarkerAnimationPop
                    marker.map = self.view as! GMSMapView?
                    marker.map?.delegate = self
                    // Set marker data
                    let test = Marker(_id: id, title: title, address: address, category: category, description: description, url: url, latitude: latitude, longitude: longitude)
                    marker.userData = test
                }
            }
            
        }
    }
    

    
    // MARK: - HELPER FUNCTION
    
    private func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let userLocation:CLLocation = locations[0] as! CLLocation;
        long = userLocation.coordinate.longitude;
        lat = userLocation.coordinate.latitude;
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 }
