/**
 * simple reading from serial
 *
 * 1. you have to check where your Arduino board is connected
 * use the list_serial_ports.pde sketch
 *
 * 2. upload the sketch c2c_outgoing.ino to your board
 *
 * @author: Fabian Morón Zirfas
 */

import processing.serial.*; // import the lib
/**
 * Due to the fact that light depended resistors always give
 * different readings we need this value to calibrate the range
 */
float maximum = 0; // set it as low as possible
float minimum = 1023; // set it as high as possible

Serial port;     // Create object from Serial class
String sensorvalue; // Data received from the serial port

/** executed once */
void setup() {
  size(400,400); // not important
  /**
   * now get the right serial port on your computer
   * use the list_serial_ports.pde sketch
   */
  String portname = Serial.list()[5]; // <-- this index may vary!
  port = new Serial(this, portname, 9600); // new serial port item
  port.bufferUntil('\n');

}

void draw() {
// these aren't the droids you are looking for
// everything happens in serialEvent
}

/**
 * this is called if something happens on the serial
 * checkout: http://processing.org/reference/libraries/serial/serialEvent_.html
 */
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readString();

  if (inString != null) {
    inString = trim(inString); // trim off any whitespace:
    float value = float(inString);// cast to float value

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
