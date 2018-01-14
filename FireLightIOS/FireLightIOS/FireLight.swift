class Firelight
{
	var mode : Int = 1
	var LedManager :LedControl
	var DeviceManager :DeviceList
	
    init()
    {
        LedManager = LedControl(demo : mode)
        DeviceManager = DeviceList()
    }
 


}
