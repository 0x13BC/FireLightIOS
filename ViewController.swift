import CoreBluetooth

class ViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate 
	{

		var manager: CBCentralManager!
		var peripheral: CBPeripheral!

		let BEAN_NAME = "Robu"  
		let BEAN_SCRATCH_UUID = CBUUID(string: "a495ff21-c5b1-4b44-b512-1370f02d74de")
		let BEAN_SERVICE_UUID = CBUUID(string: "a495ff20-c5b1-4b44-b512-1370f02d74de")

		override func viewDidLoad() 
		{  
			super.viewDidLoad()        
			manager = CBCentralManager(delegate: self, queue: nil)
		}

		func centralManagerDidUpdateState(central: CBCentralManager)
		{  
		 if central.state == CBCentralManagerState.PoweredOn 
			{
				central.scanForPeripheralsWithServices(nil, options: nil)
			} 
		else
			{
				print("Bluetooth not available.")
			}
		}

		func centralManager(central: CBCentralManager,didDiscoverPeripheral peripheral: CBPeripheral,advertisementData: [String : AnyObject],RSSI: NSNumber)
		{
			let device = (advertisementData as NSDictionary).objectForKey(CBAdvertisementDataLocalNameKey) as? NSString

			if device?.containsString(BEAN_NAME) == true 
			{
				self.manager.stopScan()

				self.peripheral = peripheral
			self.peripheral.delegate = self
			manager.connectPeripheral(peripheral, options: nil)
			}
		}

		func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) 
		{
			peripheral.discoverServices(nil)
		}

		func peripheral(peripheral: CBPeripheral,didDiscoverServices error: NSError?)
		{
			for service in peripheral.services! 
			{
				let thisService = service as CBService

				if service.UUID == BEAN_SERVICE_UUID
				{
					peripheral.discoverCharacteristics(nil, forService: thisService)
				}
			}
		}

		func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?)
		{
			for characteristic in service.characteristics! 
			{
				let thisCharacteristic = characteristic as CBCharacteristic

				if thisCharacteristic.UUID == BEAN_SCRATCH_UUID 
				{
      				self.peripheral.setNotifyValue(true, forCharacteristic: thisCharacteristic)
    			}
  			}
		}

		func peripheral(peripheral: CBPeripheral,didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?)
		{
  			var count:UInt32 = 0;
			if characteristic.UUID == BEAN_SCRATCH_UUID 
				{
					characteristic.value!.getBytes(&count, length: sizeof(UInt32))
					labelCount.text = NSString(format: "%llu", count) as String
				}
		}

		func centralManager(central: CBCentralManager,didDisconnectPeripheral peripheral: CBPeripheral,error: NSError?)
		{
 				central.scanForPeripheralsWithServices(nil, options: nil)
		}

	}