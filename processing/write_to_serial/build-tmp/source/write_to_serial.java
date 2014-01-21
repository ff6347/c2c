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

public class write_to_serial extends PApplet {

/**
 * write_to_serial.pde
 * Simple sketch writing to the serial
 *
 * first you have to check where your Arduino board is connected
 * use the list_serial_ports.pde sketch
 *
 * @author: Fabian Mor\u00f3n Zirfas
 */
 // import the lib


Serial port;     // Create object from Serial class

int value = 0; // the value to turn the led on and off
 public void setup() {
  String portname = Serial.list()[5]; // <-- this index may vary!
  port = new Serial(this, portname, 9600); // new serial port item
 }

 public void draw() {

 }

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      port.write('1'); // send data
    } else if (keyCode == DOWN) {
      value = 0; //led is of
      port.write('0'); // send data
    }
  }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "write_to_serial" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
