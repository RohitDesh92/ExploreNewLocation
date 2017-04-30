//
//  MapController.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 4/25/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate {
    
    var lat:Double = 0.00;
    var long:Double = 0.00;
    var myLocation = CLLocationCoordinate2DMake(0.0,0.0);
    var name:String = " "
    
    @IBAction func SaveSpot(_ sender: Any) {
        
        let alert = UIAlertController(title: "Let's Explore the World", message: "Enter Memory or Location Name", preferredStyle: UIAlertControllerStyle.alert) // create text alert
        alert.addTextField { (textField) in
             textField.text = "type something :)"
        }
   
        self.present(alert, animated: true, completion: nil)   // Putting Pin to lat long

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.name = (textField?.text)!
            print("Text field: \(String(describing: textField?.text))")
            let currentSpotPin: SpotPin = SpotPin(title:self.name, coordinate:self.myLocation)
            self.map.addAnnotation(currentSpotPin)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:nil))
       
        
        
    }
    
    @IBOutlet weak var map: MKMapView!
    let manager  = CLLocationManager()
   
    @IBAction func FocusPosition(_ sender: Any) {
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region,animated:true)
        self.map.showsUserLocation = true
        
        lat = location.coordinate.latitude
        long = location.coordinate.longitude
        
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
}


