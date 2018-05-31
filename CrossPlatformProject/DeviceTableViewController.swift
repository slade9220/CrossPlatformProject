//
//  DeviceTableViewController.swift
//  CrossPlatformProject
//
//  Created by Gennaro Amura on 30/05/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import UIKit

class DeviceTableViewController: UITableViewController {
    
    var devices: [Device] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        devices = loadDevice()
        print("Devices:",devices)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        print("Count: ",devices.count)
        return devices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "device", for: indexPath) as? DeviceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.label.text = "\(devices[indexPath.row].brand) \(devices[indexPath.row].name)"
        

        return cell
    }


}
