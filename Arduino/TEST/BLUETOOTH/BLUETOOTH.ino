/* This is a simple test for two way traffic via bluetooth 
   but you can try it first using the USB cable to the serial 
   monitor without the bluetooth module connected.
   
   Note that some bluetooth modules come set to a different baud rate.
   This means you need to alter the command
                Serial.begin(9600) accordingly
   Same goes for the setting in the bottom right corner on the 
   serial monitor */ 
String readString;
char c;
int redPin = 3;
int greenPin = 5;
int bluePin = 6;
void setup()
{
    pinMode(0, INPUT_PULLUP);// only needed for  JY-MCUY v1.06?
    Serial.begin(9600);
    Serial.println("OK then, you first, say something.....");
    Serial.println("Go on, type something in the space above");
    Serial.println(" and hit Send or Enter,");
    Serial.println("then I will repeat it!");
    Serial.println("");
    pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT); 
}

void loop() {
    while (Serial.available()) 
  {
    delay(3);  
    c = Serial.read();
    readString += c; 
  }// end while
  if (readString.length() >0) 
  {  
    if ( readString == "RED")
    {
    
    setColor(255, 0, 0);  // red
  }
    if ( readString == "DARK")
    {
      setColor(0, 0, 0);  // red
    }
    
    Serial.write(c);  
   readString="";  
  } // end if
}

void setColor(int red, int green, int blue)
{
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);  
}
