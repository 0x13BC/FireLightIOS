//
//  ViewController.swift
//  FireLightIOS
//
//  Created by Bezançon on 16/01/2018.
//  Copyright © 2018 FireLight. All rights reserved.
//

import UIKit

//Homepage
class ViewController: UIViewController{

    var demo : Bool = false
    
    @IBOutlet weak var demoSwitch: UISwitch!
    @IBAction func demoBool(_ sender: Any) {
        if demoSwitch.isOn
        {
            demo = true
        }
        else {
            demo = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDeviceList"
        {
            if let DeviceListControl = segue.destination as? DeviceListViewController
            {
                if demo
                {
                    DeviceListControl.demoState = false
                }
                    
                else
                {
                    DeviceListControl.demoState = true
                }
            }
            
            
        
        }
    }


}

