struct Device: Equatable
{
    var name : String
    var address : String
    
    public static func ==(lhs: Device, rhs: Device) -> Bool {
        return lhs.name == rhs.name && lhs.address == rhs.address
    }
}


class DeviceList
{
    
    var devices :[Device]
    
    init(mode demo: Bool)
    {
        self.devices = []
        if demo
        {
            for i in 0...20 {
                let r = Device(name: "Device \(i)", address: "\(i).\(i).\(i).\(i)")
                print("\(r.name):\(r.address) has been added")
                devices.append(r)
            }
        }
    }
    
    func pairedDeviceList()
    {
        
    }
    
    func listListener()
    {
        
    }
    static func demo()
    {
        
    }
    func listGenerator()
    {
        
    }
    
    func add(_ newDevice: Device) {
        devices.append(newDevice)
    }
    
    func list() -> [Device] {
        
        for d in devices {
            print(d.name)
            print(d.address)
        }
        
        return devices
    }
    
    //   func select(addressOf name: String) -> Device{
    
    // var find = false
    // var index: Bool
    // repeat {
    //       if index = devices.index(where: {$0.name == name}) {
    //         find = true
    //       } else {
    //           print("device not in array")
    //       }
    //       }while find != true
    
    //          return devices[index]
    //      }
    
    //  func select(nameOf address: String)throws -> Device  {
    
    //var find = false
    //var index
    // repeat{
    //    if  index = devices.index(where: {$0.address == address}) {
    //      find = true
    //    } else {
    //        print("device not in array")
    //    }
    // }while find != true
    //return devices[index]
    
    //          if let found = find(devices.map({ $0.name }), address) {
    //   let obj = devices[found]
    // }
    
    // guard let index = devices.index(where: { $0.name == address })
    // else {
    // print("Not found")
    // }
    // return devices[index]
    
    //}
    
    func select(at index: Int) -> Device{
        return devices[index]
    }
    
    func remove(_ device: Device) {
        
        if let index = devices.index(of: device) {
            remove(at: index)
        } else {
            print("device not in array")
        }
    }
    
    func remove(at index: Int) {
        devices.remove(at: index)
    }
    
}
