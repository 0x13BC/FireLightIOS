//
//  DeviceListViewController.swift
//  FireLightIOS
//
//  Created by Developer on 19/01/2018.
//  Copyright © 2018 FireLight. All rights reserved.
//

import UIKit
import CoreBluetooth

class DeviceListViewController: UIViewController,UITableViewDataSource ,CBCentralManagerDelegate,CBPeripheralDelegate  {
   

    @IBOutlet weak var DemoLabel: UILabel!
    
    let dataManager: Firelight = Firelight()
    var demoState : Bool?
    
    var manager: CBCentralManager!
    var peripheral: CBPeripheral!
    
    let BEAN_NAME = "Robu"
    let BEAN_SCRATCH_UUID = CBUUID(string: "a495ff21-c5b1-4b44-b512-1370f02d74de")
    let BEAN_SERVICE_UUID = CBUUID(string: "a495ff20-c5b1-4b44-b512-1370f02d74de")
    
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        if central.state == CBManagerState.poweredOn
        {
            central.scanForPeripherals(withServices: nil, options: nil)
        }
        else
        {
            print("Bluetooth not available.")
        }
    }

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
        manager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
        if let state = demoState {
            DemoLabel.isHidden = state
        }
        else{
            DemoLabel.isHidden = false
        }
    }
    private func centralManager(central: CBCentralManager,didDiscoverPeripheral peripheral: CBPeripheral,advertisementData: [String : AnyObject],RSSI: NSNumber)
    {
        let device = (advertisementData as NSDictionary).object(forKey: CBAdvertisementDataLocalNameKey) as? NSString
        
        if device?.contains(BEAN_NAME) == true
        {
            self.manager.stopScan()
            
            self.peripheral = peripheral
            self.peripheral.delegate = self
            manager.connect(peripheral, options: nil)
        }
    }
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral)
    {
        peripheral.discoverServices(nil)
    }
    
    func peripheral(_ peripheral: CBPeripheral,didDiscoverServices error: Error?)
    {
        for service in peripheral.services!
        {
            let thisService = service as CBService
            
            if service.uuid == BEAN_SERVICE_UUID
            {
                peripheral.discoverCharacteristics(nil, for: thisService)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?)
    {
        for characteristic in service.characteristics!
        {
            let thisCharacteristic = characteristic as CBCharacteristic
            
            if thisCharacteristic.uuid == BEAN_SCRATCH_UUID
            {
                self.peripheral.setNotifyValue(true, for: thisCharacteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral,didUpdateValueFor characteristic: CBCharacteristic, error: Error?)
    {
        var count:UInt8 = 0;
        if characteristic.uuid == BEAN_SCRATCH_UUID
        {
            characteristic.value!.copyBytes(
                to: &count,
                count: characteristic.value!.count
            )
            
            print( count )
        }

        
    }
    
    func centralManager(_ central: CBCentralManager,didDisconnectPeripheral peripheral: CBPeripheral,error: Error?)
    {
        central.scanForPeripherals(withServices: nil, options: nil)
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
        
        if let cell = sender as? UITableViewCell {
            if let DeviceViewControl = segue.destination as? DeviceViewController
            {
                DeviceViewControl.nameDevice = cell.textLabel?.text
            }
        }
    
    }

}
