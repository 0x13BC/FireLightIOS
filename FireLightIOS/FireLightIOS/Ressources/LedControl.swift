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
