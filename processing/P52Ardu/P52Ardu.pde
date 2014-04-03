// Example by fabiantheblind based on
// examples by Tom Igoe

// press a key and Processing sends a value
// and gets amessage back from the ARduino Boards
import processing.serial.*;

// The serial port:
Serial myPort;
int lf = 10;    // Linefeed in ASCII
String myString = null;
// List all the available serial ports:

void setup(){
// Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[5], 9600);
   myPort.clear();
  // Throw out the first reading, in case we started reading 
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;
}

void draw(){
  if ( myPort.available() > 0) {  // If data is available,
//    val = myPort.read(); 
      myString = myPort.readStringUntil(lf);
    if (myString != null) {
      println(myString);
    }
  }
 
}

void keyPressed(){
  myPort.write(key - '0'); // <-- This is a bit wired but does the trick
  print("Sending key: " + (key) + " Value:" + int(key -'0') + '\n');
}
