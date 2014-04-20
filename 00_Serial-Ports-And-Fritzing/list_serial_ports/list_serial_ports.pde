/**
 * simple port listing
 * Compare these ports to the ones you can select
 * within the arduino IDE
 * @author: Fabian Morón Zirfas
 */
import processing.serial.*;

// loop through all your ports and list them
for(int i = 0; i < Serial.list().length;i++){
  println( "Portnumber: "  + i + " || Portname :"+ Serial.list()[i]);
}
