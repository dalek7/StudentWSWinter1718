
int ledPin = 9;    // LED connected to digital pin 9

void setup() {

  pinMode(LED_BUILTIN, OUTPUT);
  
  Serial.begin(9600);
  
}

// the loop function runs over and over again forever
void loop() {
  
}

void serialEvent() {
  while (Serial.available()) {
    
    int v = Serial.read();

    if(v=='1')
    {
      digitalWrite(LED_BUILTIN, HIGH);  
   }
   else if(v=='2')
    {
      digitalWrite(LED_BUILTIN, LOW);  
   }
  
  }
}


