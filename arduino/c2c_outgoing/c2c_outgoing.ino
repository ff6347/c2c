int ldrPin = A0; // the LDR
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600); // init the Serial 
}

void loop() {
    int LDRReading = analogRead(ldrPin); 
    Serial.println(LDRReading);
    delay(10); //just here to slow down the output

}
