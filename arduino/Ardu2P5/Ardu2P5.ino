/*
 Example by fabiantheblind based on
 examples by Tom Igoe
 Reading/Writing a serial ASCII-encoded string.
 */
 
//pins
int out = 13;
void setup() {
  // initialize serial:
  Serial.begin(9600);
  // make the pins outputs:
  pinMode(out, OUTPUT); 
  //  pinMode(greenPin, OUTPUT); 
  //  pinMode(bluePin, OUTPUT); 

}

void loop() {
  // if there's any serial available, read it:
  //  if(Serial.available() > 0){
  //  Serial.println("available");
  //  }
  while (Serial.available() > 0) {

    // look for the next valid integer in the incoming serial stream:
    int val = int(Serial.read());
    Serial.print("Message recieved\n");

    // look for the newline. That's the end of your
    // sentence:
    //    if (Serial.read() == '\n') {
    Serial.print("I'm your Arduino Board and I recieved from P5: ");      
    Serial.println(val);
    for(int i = 0; i < val; i++){
      Serial.print("blink number ");
      Serial.print(i+1);
      digitalWrite(out,HIGH);

      delay(100);

      digitalWrite(out,LOW);
      delay(100);
      if(i == val -1){
        Serial.println('\n');
      }
      else{
        Serial.print(" || ");
      }
    }

    //    } // end of looking for newline char
  }
}

