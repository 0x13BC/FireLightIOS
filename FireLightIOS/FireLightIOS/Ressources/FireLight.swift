import Foundation

class Firelight
{
    var demo : Bool = true
    var LedManager :LedControl
    var DeviceManager :DeviceList
    
    
    init()
    {
        LedManager = LedControl(mode :demo)
        DeviceManager = DeviceList(mode :demo)
    }
    init(demo : Bool)
    {
        self.demo = demo
        LedManager = LedControl(mode :demo)
        DeviceManager = DeviceList(mode :demo)
    }
    
    func dispList()
    {
        let _ = DeviceManager.list()
    }
    
    func pickDevice() -> Device
    {
        print("Select the id of a device.")
        let s = readLine()
        let id = Int(s!)
        
        let selectedDevice = DeviceManager.select(at : id!)
        print(selectedDevice.name)
        print(selectedDevice.address)
        
        return selectedDevice
    }
    
    func controlDevice(_ device : Device)
    {
        if demo
        {
            ConnectionBl.demo()
            let bluetoothManager = ConnectionBl(device)
            bluetoothManager.Connect()
            bluetoothManager.TestConnect()
            bluetoothManager.send(value: LedManager)
            
            bluetoothManager.Disconnect()
        }
        else
        {
            
        }
    }
    
    
}
