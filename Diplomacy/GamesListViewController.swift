//
//  GamesListViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/12/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class GamesListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
}
