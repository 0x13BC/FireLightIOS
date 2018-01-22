char command;
char selecColor=' ';
int color[3]={255,255,255};
String string;
boolean ledon = false;
#define red 6
#define blue 5
#define green 3

  void setup()
  {
    Serial.begin(9600);
    pinMode(red, OUTPUT);
    pinMode(green, OUTPUT);
    pinMode(blue, OUTPUT);
  }

  void loop()
  {
    if (Serial.available() > 0) 
    {string = "";}
    
    while(Serial.available() > 0)
    {
      command = ((byte)Serial.read());
      
      if(command == ':')
      {
        break;
      }
      
      else
      {
        string += command;
      }
      
      delay(1);
    }
    
    if(string == "TO")
    {
        ledOn();
        ledon = true;
    }
    
    if(string =="TF")
    {
        ledOff();
        ledon = false;
        Serial.println(string);
    }
    if(string.charAt(0)=='R'||string.charAt(0)=='B'||string.charAt(0)=='R')
    {
      selecColor=string.charAt(0);
      Serial.println(selecColor);
      Serial.println("String avant remove " + string);
      string.remove(0,1);
      Serial.println("String après remove" + string);
    }
    
    if ((string.toInt()>=0)&&(string.toInt()<=255))
    {
      if (ledon==true)
      {
        switch(selecColor)
        {
         case 'R':
            analogWrite(red, string.toInt());
        Serial.println(string);
          break;
         
         case 'B':
           analogWrite(blue, string.toInt());
        Serial.println(string);
           break;
           
         case 'G':
           analogWrite(green, string.toInt());
        Serial.println(string);
           break;
           
         default:
           break;
        }
        
        delay(10);
      }
    }
 }
 
void ledOn()
   {
      analogWrite(red, 255);
      analogWrite(blue, 255);
      analogWrite(green, 255);
      delay(10);
    }
 
 void ledOff()
 {
      analogWrite(red, 0);
      analogWrite(blue, 0);
      analogWrite(green, 0);
      delay(10);
 }
 

    
