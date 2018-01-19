//
//  DeviceListViewController.swift
//  FireLightIOS
//
//  Created by Developer on 19/01/2018.
//  Copyright © 2018 FireLight. All rights reserved.
//

import UIKit

class DeviceListViewController: UIViewController,UITableViewDataSource  {

    @IBOutlet weak var DemoLabel: UILabel!
    
    let dataManager: Firelight = Firelight()
    var demoState : Bool?
    
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

        // Do any additional setup after loading the view.
        if let state = demoState {
            DemoLabel.isHidden = state
        }
        else{
            DemoLabel.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    
    }

}
