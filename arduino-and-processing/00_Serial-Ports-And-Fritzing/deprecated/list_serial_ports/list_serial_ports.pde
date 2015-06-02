/**
 * simple port listing
 *
 * @author: Fabian Morón Zirfas
 */
import processing.serial.*;

// loop through all your ports and list them
for(int i = 0; i < Serial.list().length;i++){
  println( "Portnumber: "  + i + " || Portname :"+ Serial.list()[i]);
}
