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

public class list_serial_ports extends PApplet {
  public void setup() {
/**
 * simple prto listing
 *
 */


// loop through all your ports and list them
for(int i = 0; i < Serial.list().length;i++){
  println( "Portnumber: "  + i + " || Portname :"+ Serial.list()[i]);
}
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "list_serial_ports" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
