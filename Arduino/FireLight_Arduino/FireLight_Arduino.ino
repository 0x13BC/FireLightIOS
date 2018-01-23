char c = ' ';
char selecColor=' ';
int color[3]={255,255,255};
String readString;
boolean ledon = false;

#define OFF '0'
#define ON '1'
#define WAVE '2'

int redPin = 3;   // Red LED,   connected to digital pin 3
int greenPin = 5;  // Green LED, connected to digital pin 5
int bluePin = 6;  // Blue LED,  connected to digital pin 6

// Color arrays
int black[3]  = { 0, 0, 0 };
int white[3]  = { 100, 100, 100 };
int red[3]    = { 100, 0, 0 };
int green[3]  = { 0, 100, 0 };
int blue[3]   = { 0, 0, 100 };
int yellow[3] = { 40, 95, 0 };
int dimWhite[3] = { 30, 30, 30 };
// etc.

// Set initial color
int redVal = black[0];
int grnVal = black[1]; 
int bluVal = black[2];

int wait = 10;      // 10ms internal crossFade delay; increase for slower fades
int hold = 0;       // Optional hold when a color is complete, before the next crossFade
int DEBUG = 1;      // DEBUG counter; if set to 1, will write values back via serial
int loopCount = 60; // How often should DEBUG report?
int repeat = 3;     // How many times should we loop before stopping? (0 for no stop)
int j = 2;          // Loop counter for repeat
String mod = "0";

// Initialize color variables
int prevR = redVal;
int prevG = grnVal;
int prevB = bluVal;

void setup()
{
	Serial.begin(9600);
	pinMode(redPin, OUTPUT);
	pinMode(greenPin, OUTPUT);
	pinMode(bluePin, OUTPUT);
}

void loop()
{
	
	if (readString.length() >0) 
	{  
		mod = readString;
		int order = readString.length() - 1;
		switch (mod[order])
		{
			
		case OFF:
			ledOff();
			redVal = black[0];
			grnVal = black[1]; 
			bluVal = black[2];
			prevR = redVal;
			prevG = grnVal;
			prevB = bluVal;
			break;
			
		case ON:
			ledOn();
			redVal = white[0];
			grnVal = white[1]; 
			bluVal = white[2];
			prevR = redVal;
			prevG = grnVal;
			prevB = bluVal;
			break;
			
		case WAVE:
			
			//while(Serial.available() < 1 ){
				crossFade(red);
				crossFade(green);
				crossFade(blue);
				crossFade(yellow);
				if(repeat) // Do we loop a finite number of times?
				{
					j += 1;
					if (j >= repeat) { // Are we there yet?
						exit(j);  // If so, stop.
					}     
				}
			//}
			
			
		}
		
		Serial.write(c);  
		readString="";  
	} // end if
}

void serialEvent() {
	
	while (Serial.available()) 
	{
		delay(3);  
		c = (char)Serial.read();
		readString += c; 
	}// end while
}

void ledOn()
{
	setColor( white[0], white[1], white[2]);
}

void ledOff()
{
	setColor(black[0],black[1],black[2]);
}

void setColor(int red, int green, int blue)
{
	analogWrite(redPin, red);
	analogWrite(greenPin, green);
	analogWrite(bluePin, blue);  
}

/// FADE RGB

/* BELOW THIS LINE IS THE MATH -- YOU SHOULDN'T NEED TO CHANGE THIS FOR THE BASICS
* 
* The program works like this:
* Imagine a crossfade that moves the red LED from 0-10, 
*   the green from 0-5, and the blue from 10 to 7, in
*   ten steps.
*   We'd want to count the 10 steps and increase or 
*   decrease color values in evenly stepped increments.
*   Imagine a + indicates raising a value by 1, and a -
*   equals lowering it. Our 10 step fade would look like:
* 
*   1 2 3 4 5 6 7 8 9 10
* R + + + + + + + + + +
* G   +   +   +   +   +
* B     -     -     -
* 
* The red rises from 0 to 10 in ten steps, the green from 
* 0-5 in 5 steps, and the blue falls from 10 to 7 in three steps.
* 
* In the real program, the color percentages are converted to 
* 0-255 values, and there are 1020 steps (255*4).
* 
* To figure out how big a step there should be between one up- or
* down-tick of one of the LED values, we call calculateStep(), 
* which calculates the absolute gap between the start and end values, 
* and then divides that gap by 1020 to determine the size of the step  
* between adjustments in the value.
*/

int calculateStep(int prevValue, int endValue) {
	int step = endValue - prevValue; // What's the overall gap?
	if (step) {                      // If its non-zero, 
		step = 1020/step;              //   divide by 1020
	} 
	return step;
}

/* The next function is calculateVal. When the loop value, i,
*  reaches the step size appropriate for one of the
*  colors, it increases or decreases the value of that color by 1. 
*  (R, G, and B are each calculated separately.)
*/

int calculateVal(int step, int val, int i) {

	if ((step) && i % step == 0) { // If step is non-zero and its time to change a value,
		if (step > 0) {              //   increment the value if step is positive...
			val += 1;           
		} 
		else if (step < 0) {         //   ...or decrement it if step is negative
			val -= 1;
		} 
	}
	// Defensive driving: make sure val stays in the range 0-255
	if (val > 255) {
		val = 255;
	} 
	else if (val < 0) {
		val = 0;
	}
	return val;
}

/* crossFade() converts the percentage colors to a 
*  0-255 range, then loops 1020 times, checking to see if  
*  the value needs to be updated each time, then writing
*  the color values to the correct pins.
*/

void crossFade(int color[3]) {
	// Convert to 0-255
	int R = (color[0] * 255) / 100;
	int G = (color[1] * 255) / 100;
	int B = (color[2] * 255) / 100;

	int stepR = calculateStep(prevR, R);
	int stepG = calculateStep(prevG, G); 
	int stepB = calculateStep(prevB, B);

	int i = 0;
	while ( i<= 1020 && Serial.available() < 1) {
		redVal = calculateVal(stepR, redVal, i);
		grnVal = calculateVal(stepG, grnVal, i);
		bluVal = calculateVal(stepB, bluVal, i);

		
		setColor(redVal,grnVal,bluVal); // Write current values to LED pins

		delay(wait); // Pause for 'wait' milliseconds before resuming the loop

		if (DEBUG) { // If we want serial output, print it at the 
			if (i == 0 or i % loopCount == 0) { // beginning, and every loopCount times
				Serial.print("Loop/RGB: #");
				Serial.print(i);
				Serial.print(" | ");
				Serial.print(redVal);
				Serial.print(" / ");
				Serial.print(grnVal);
				Serial.print(" / ");  
				Serial.println(bluVal); 
			} 
			DEBUG += 1;
		}
		i++;
	}
	// Update current values for next loop
	prevR = redVal; 
	prevG = grnVal; 
	prevB = bluVal;
	delay(hold); // Pause for optional 'wait' milliseconds before resuming the loop
}


