//
//  CoreDataManager.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 5/19/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager: NSObject{
  
    private class func getContext() -> NSManagedObjectContext{
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    
    }
    
    class func deleteAll(){
        
        let context = getContext()
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Spotlocation")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            try context.execute(request)
            
        } catch  {
            
        }
        
        
    }
    
    class func saveLocation(){
        
        let context = getContext()
        let newLoc = NSEntityDescription.entity(forEntityName: "Spotlocation", in: context)
        let managedObject = NSManagedObject(entity: newLoc!, insertInto: context)
        
        managedObject.setValue(gloSpotName, forKey: "spotname")
        managedObject.setValue(gloLat, forKey: "latitude")
        managedObject.setValue(gloLon, forKey: "longitude")
        
        
        do {
            try context.save()
            print("Saved")
            
        } catch  {
            print(error.localizedDescription)
        }
    
    
    }
    
    class func getObject() -> [locaModel]{
        
        var aray = [locaModel]()
        
        let fetchRequest : NSFetchRequest<Spotlocation> = Spotlocation.fetchRequest()
        do {
            let fetchResult = try getContext().fetch(fetchRequest)
            print(fetchResult)
            
            for item in fetchResult{
                let mod = locaModel(locName: item.spotname!, Latitude: item.latitude, Longitude: item.longitude)
                aray.append(mod)
            }
        } catch  {
            
        }
        return aray
    
    
    
    }
    
    
    struct locaModel {
        var locName: String
        var Latitude: Double
        var Longitude: Double
        
        init() {
            locName = " "
            Latitude = 0.00
            Longitude = 0.00
        }
        
        init(locName: String, Latitude: Double,Longitude: Double) {
            self.locName = locName
            self.Latitude = Latitude
            self.Longitude = Longitude
            
        }
    }
    
    
 


}
