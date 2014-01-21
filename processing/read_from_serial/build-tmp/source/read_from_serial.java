import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class read_from_serial extends PApplet {

/**
 * simple sketch reading from serial
 *
 * first you have to check where your Arduino board is connected
 * use the list_serial_ports.pde sketch
 * @author: Fabian Mor\u00f3n Zirfas
 */

 // import the lib
/**
 * Due to the fact that light depended resistors always give
 * different readings we need this value to calibrate the range
 */
float maximum = 0; // set it as low as possible
float minimum = 1023; // set it as high as possible

Serial port;     // Create object from Serial class
String sensorvalue; // Data received from the serial port

/** executed once */
public void setup() {
  size(400,400); // not important
  /**
   * now get the right serial port on your computer
   * use the list_serial_ports.pde sketch
   */
  String portname = Serial.list()[5]; // <-- this index may vary!
  port = new Serial(this, portname, 9600); // new serial port item
  port.bufferUntil('\n');

}

public void draw() {
// these aren't the droids you are looking for
// everything happens in serialEvent
}

/**
 * this is called if something happens on the serial
 * checkout: http://processing.org/reference/libraries/serial/serialEvent_.html
 */
public void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readString();

  if (inString != null) {
    inString = trim(inString); // trim off any whitespace:
    float value = PApplet.parseFloat(inString);// cast to float value

    /** calibration of the incoming values*/
    if(value > maximum){ maximum = value; }
    if(value < minimum){ minimum = value; }

    // now map the value into our range
    float mappedval =  map(value,minimum,maximum,0,255);
    // just some output to see whats going on
    println("value: " + value);
    println("maximum: " + maximum);
    println("minimum: " + minimum);
    println("mappedval: " + mappedval);

    // finally set the background color
    background(mappedval);
   }
 }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "read_from_serial" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
