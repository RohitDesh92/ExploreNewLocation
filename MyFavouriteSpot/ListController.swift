//
//  ListController.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 4/26/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//


import UIKit

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let list = [ "Location 1", "Location 2", "Location 3", "Location 4", "Location 5", "Location 6", "Location 7", "Location 8", "Location 9", "Location 10" ]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return list.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "cell" )
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    
}
