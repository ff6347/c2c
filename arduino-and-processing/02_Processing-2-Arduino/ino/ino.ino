int ledPin = 13; // the LED
char val; // the data to read from processing
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600); // init the Serial
pinMode(ledPin, OUTPUT); // init the LED pin as output
}

void loop() {
    if(Serial.available()){
      val = Serial.read();
    }
      if (val == '1')
   { // If 1 was received
     digitalWrite(ledPin, HIGH); // turn the LED on
   } else {
     digitalWrite(ledPin, LOW); // otherwise turn it off
   }
    delay(10); //just here to slow down the input

}
