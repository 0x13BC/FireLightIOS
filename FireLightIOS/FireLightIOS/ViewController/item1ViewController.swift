//
//  item1ViewController.swift
//  FireLightIOS
//
//  Created by Developer on 22/01/2018.
//  Copyright © 2018 FireLight. All rights reserved.
//

import UIKit

class item1ViewController: UIViewController {
    
    @IBOutlet weak var DeviceName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeviceName.text = (self.tabBarController as? DeviceViewController)?.nameDevice
        // Do any additional setup after loading the view.
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

}
