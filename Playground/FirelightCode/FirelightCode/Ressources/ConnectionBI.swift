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
    init(_ device :Device)
    {
        self.name = device.name
        self.address = device.address
    }
    
    func Connect()
    {
        print("Device: \(name) with the address: \(address) is Connected. ")
        
    }
    
    func Disconnect()
    {
        print("Device: \(name) with the address: \(address) is Disconnected.")
    }
    
    func Message()
    {
        print("Lol")
        
    }
    
    func send<T>(value a: T )
    {
        print("\(a) was sent.")
    }
    
    func receive() -> String
    {
        let data = readLine()
        return data!
    }
    
    func TestConnect()
    {
        let test = "Ping!"
        self.send(value: test)
        print("waiting response...")
        if self.receive() == "Pong!"
        {
            print("Connection is okay")
        }
        else
        {
            print("Connection problem")
        }
    }
    
    static public func demo()
    {
        print("This is the demo")
    }
}
