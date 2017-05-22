//
//  ListController.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 4/26/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//


import UIKit
import CoreData
import MapKit

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var res = CoreDataManager.getObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return res.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "cell" )
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        let a = res[indexPath.row]
        cell.textLabel?.text = a.locName
        return(cell)
    

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let r = res[indexPath.row]
        print(" Name:", r.locName,"Latitude:", r.Latitude ,"Longitude:", r.Longitude);
        let latitude:CLLocationDegrees = r.Latitude
        let longitude:CLLocationDegrees =  r.Longitude
        let regoinDistance: CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regoinDistance, regoinDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey:NSValue(mkCoordinateSpan: regionSpan.span)]
        let placemark = MKPlacemark (coordinate: coordinates)
        let MapItem = MKMapItem(placemark: placemark)
        MapItem.name = r.locName
        MapItem.openInMaps(launchOptions: options)
        
    }

}
