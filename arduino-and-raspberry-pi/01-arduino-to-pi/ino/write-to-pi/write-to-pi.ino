void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13, OUTPUT);

}

void loop() {
    Serial.println('0');
    delay(500);
    Serial.println('1');
    delay(500);
  // put your main code here, to run repeatedly:

}
