// Echo

void setup() {
  // initialize serial:
  Serial.begin(9600);
  
}

void loop() {


  
}

/*
  SerialEvent occurs whenever a new data comes in the hardware serial RX. This
  routine is run between each time loop() runs, so using delay inside loop can
  delay response. Multiple bytes of data may be available.
*/
void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read();
    char buf[255]; 
    sprintf(buf, "%c", inChar);
    Serial.println(buf);
  }
}
