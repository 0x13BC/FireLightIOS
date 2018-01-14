//: Playground - noun: a place where people can play

//import CoreBluetooth

//#Region ConnectionBl.swift
class ConnectionBl
{
	var name : String
	var adress : String

    init(name : String, adress : String)
    {
        self.name=name
        self.adress=adress
    }
    init()
    {
        name = ""
        adress = ""
    }
	
	func Connect()
	{

	}

	func Disconnect()
	{

	}

	func Message()
	{

	}

	func send()
	{

	}

	func receive()
	{
		
	}
	
	func TestConnect()
	{

	}
}
//#EndRegion

//#Region DeviceList.swift
struct Device
{
	var name : String
	var adress : String
}


class DeviceList
{
	
    var Devices :[Device]
    
    init(mode demo: int)
    {
        self.Devices = [Device]()
        if mode == 1
        {

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

}
//#EndRegion

//#Region LedControl.swift
class LedControl 
{ 
	var RGB :[UInt8] = [255,255,255]
	var HSL :[Double] = [350,100,100]
	var modeColors : String = "HSL"   
	var id = 0

	var BluetoothManager :ConnectionBl
    
    init(mode demo : Int)
    {
        if demo == 1
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

//Region Firelight
class Firelight
{
	var demo : int = 0
	var LedManager :LedControl = LedControl(mode : demo)
	var DeviceManager :DeviceList = DeviceList(mode : demo)
	
    init()
    {
    }
    
 
}
//#EndRegion

class Test
{
	public static func run()
    {

    }
}



