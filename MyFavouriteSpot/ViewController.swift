//
//  ViewController.swift
//  MyFavouriteSpot
//
//  Created by Rohit Deshmukh on 4/25/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBAction func Start(_ sender: Any) {
        self.performSegue(withIdentifier: "MapSegue", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
