//
//  SpotPin.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 4/29/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//

import MapKit

class SpotPin: NSObject, MKAnnotation{

   var title: String?
   var coordinate: CLLocationCoordinate2D
    
    init(title: String,coordinate: CLLocationCoordinate2D ) {
        self.title = title
        self.coordinate = coordinate
    }
    

}
