int ledPin = 13; // the LED
int ldrPin = A0; // the LDR
char val; // the data to read from processing
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600); // init the Serial 
pinMode(ledPin, OUTPUT); // init the LED pin as output
}

void loop() {
    int LDRReading = analogRead(ldrPin); 
    Serial.println(LDRReading);
    if(Serial.available()){
      val = Serial.read();
    }
      if (val == '1') 
   { // If 1 was received
     digitalWrite(ledPin, HIGH); // turn the LED on
   } else {
     digitalWrite(ledPin, LOW); // otherwise turn it off
   }
  // put your main code here, to run repeatedly:
    delay(10); //just here to slow down the output for easier reading

}
