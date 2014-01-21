/**
 * Simple writing to the serial
 *
 * 1. you have to check where your Arduino board is connected
 * use the list_serial_ports.pde sketch
 *
 * 2. upload the sketch c2c_incoming.ino to your board
 *
 * @author: Fabian Morón Zirfas
 */
import processing.serial.*; // import the lib


Serial port;     // Create object from Serial class

int value = 0; // the value to turn the led on and off
 void setup() {
  String portname = Serial.list()[5]; // <-- this index may vary!
  port = new Serial(this, portname, 9600); // new serial port item
 }

 void draw() {
// these aren't the droids you are looking for
// everything happens in serialEvent
 }

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      port.write('1'); // send data
    } else if (keyCode == DOWN) {
      value = 0; //led is of
      port.write('0'); // send data
    }
  }

}