// Processing Sketch
/* SendingBinaryToArduino
 * Sprache: Processing
  adpted from here
  http://my.safaribooksonline.com/book/hardware/arduino/9783868999235/4dot-serielle-kommunikation/id648372
 */
import processing.serial.*;

Serial myPort;  // Serial-Objekt erzeugen
public static final char HEADER    = 'H';
public static final char MOUSE_TAG = 'M';

void setup()
{
  size(512, 512);
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
}

void draw(){
}

void serialEvent(Serial p) {
  // handle incoming serial data
  String inString = myPort.readStringUntil('\n');
  if(inString != null) {
    print( inString );   // Textstring vom Arduino ausgeben
  }
}

void mousePressed() {
  sendMessage(MOUSE_TAG, 255,0,0,100);
}

void sendMessage(char tag, int r, int g, int b, int s){
  // Sende gegebenen Tag und Wert an seriellen Port
  myPort.write(HEADER);
  myPort.write(tag);
  myPort.write((char)(r / 256)); // MSB
  myPort.write(r & 0xff);  //LSB
  myPort.write((char)(g / 256)); // MSB
  myPort.write(g & 0xff);  //LSB
    myPort.write((char)(b / 256)); // MSB
  myPort.write(b & 0xff);  //LSB
      myPort.write((char)(s / 256)); // MSB
  myPort.write(s & 0xff);  //LSB
}
