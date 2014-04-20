// BinaryDataFromProcessing
// adpted from here
// http://my.safaribooksonline.com/book/hardware/arduino/9783868999235/4dot-serielle-kommunikation/id648372
// Diese Definitionen müssen denen des Senders entsprechen:
const char HEADER       = 'H';
const char MOUSE_TAG    = 'M';
const int  TOTAL_BYTES  = 10  ; // Gesamtgröße der Nachricht

// pins for the LEDs:
const int redPin = 3;
const int greenPin = 5;
const int bluePin = 6;

int red = 0;
int green = 0;
int blue = 0;
void setup(){
  Serial.begin(9600);

    pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

void loop(){
  if ( Serial.available() >= TOTAL_BYTES){
     if( Serial.read() == HEADER){
      char tag = Serial.read();
      if(tag == MOUSE_TAG){
        int r = Serial.read() * 256;
        r = r + Serial.read();
        int g = Serial.read() * 256;
        g = g + Serial.read();
        int b = Serial.read() * 256;
        b = b + Serial.read();
        int s = Serial.read() * 256;
        s = s + Serial.read();
        Serial.print("Maus-Nachricht empfangen");
        Serial.print(", r =  ");
        Serial.print(r);
        Serial.print(", g =  ");
        Serial.print(g);
        Serial.print(", b =  ");
        Serial.print(b);
        Serial.print(", s =  ");
        Serial.println(s);

        red = r;
        green = g;
        blue = b;

      analogWrite(redPin, red);
      analogWrite(greenPin, green);
      analogWrite(bluePin, blue);

      }else{
        Serial.print("Unbekannter Tag in Nachricht: ");
        Serial.write(tag);
      }
    }
  }
}
