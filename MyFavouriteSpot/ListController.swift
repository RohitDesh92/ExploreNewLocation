//
//  ListController.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 4/26/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//


import UIKit
import CoreData

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
}
