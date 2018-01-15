//: Playground - noun: a place where people can play

//import CoreBluetooth

//#Region ConnectionBl.swift -CB
class ConnectionBl
{
	static let ALERT_DISCONNECTED = "Device has been Disconnected"
	static let I_M_HERE = "You are here"
	static let ERR = "Error during proccess"

	var name : String
	var address : String

    init(name : String, address : String)
    {
        self.name=name
        self.address=address
    }
    init()
    {
        name = ""
        address = ""
    }
	
	func Connect()
	{
		print("Device: \(name) with the address \(address) is Connected. ")

	}

	func Disconnect()
	{
		print("Device: \(name) with the address \(address) is Disconnected.")
	}

	func Message()
	{


	}

	func send<T>(value a: T )
	{
		print()
	}

	func receive()
	{
		
	}
	
	func TestConnect()
	{

	}
}
//#EndRegion

//#Region DeviceList.swift -DL
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

    func remove(_ toto: Device) {

        if let index = devices.index(of: toto) {
            remove(at: index)
        } else {
            print("device not in array")
        }
    }

    func remove(at index: Int) {
        devices.remove(at: index)
    }

}
//#EndRegion

//#Region LedControl.swift -LC
class LedControl 
{ 
	var RGB :[UInt8] = [255,255,255]
	var HSL :[Double] = [350,100,100]
	var modeColors : String = "HSL"   
	var id = 0

	var BluetoothManager :ConnectionBl
    
    init(mode demo : Bool)
    {
        if demo
        {
            BluetoothManager = ConnectionBl()
        }
        else
        {
            BluetoothManager = ConnectionBl()
        }
        
        
    }
	func rgbToHsl()
	{

	}
	func HslToRgb()
	{

	}

	func TurnOffLed()
	{
		print("Led is Off")
	}
	func TurnOnLed()
	{
		print("Led is On")

	}
	func Wave()
	{
		print("Led is waving")

	}
}
//#EndRegion

//Region Firelight -FL
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
    
 
}
//#EndRegion

class Test // -Test
{
	public static func run()
    {
    	let app: Firelight = Firelight()
    	app.dispList()
    }
}


Test.run()
