//
//  ViewController.swift
//  FireLightIOS
//
//  Created by Bezançon on 16/01/2018.
//  Copyright © 2018 FireLight. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    let dataManager: Firelight = Firelight()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.DeviceManager.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LightCell", for: indexPath)
        
        cell.textLabel?.text = dataManager.DeviceManager.devices[indexPath.row].name
        cell.detailTextLabel?.text = dataManager.DeviceManager.devices[indexPath.row].address	
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

