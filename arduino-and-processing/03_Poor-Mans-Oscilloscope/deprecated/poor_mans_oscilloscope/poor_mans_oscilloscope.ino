// see https://gist.github.com/positron96/7269466
#define ANALOG_IN 0
 
void setup() {
  Serial.begin(9600); 
}
 
void loop() {
  int val = analogRead(ANALOG_IN);
  // ??? some wired bitshifting stuff
  Serial.write( 0xff );                                                         
  Serial.write( (val >> 8) & 0xff );                                            
  Serial.write( val & 0xff );
  Serial.write("\n");
}
//Arduino Poor man's oscilloscope
