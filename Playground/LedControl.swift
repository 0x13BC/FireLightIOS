


class LedControl 
{ 
	var RGB :[UInt8] = [255,255,255]
	var HSL :[Double] = [350,100,100]
	var modeColors : String = "HSL"   
	var id = 0

	var BluetoothManager :ConnectionBl
    
    init(demo : Int)
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

	}
	func TurnOnLed()
	{

	}
	func Wave()
	{

	}



	
}

