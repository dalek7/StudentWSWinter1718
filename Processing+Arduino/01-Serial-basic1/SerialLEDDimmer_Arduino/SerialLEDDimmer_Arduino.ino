// 717006 Seung-Chan Kim
// 00_2_FadingLED 와 01_4_SerialLEDControl의 조합


int ledPin = 9;    // LED connected to digital pin 9
int fadeValue = 128; // 0~255 값
void setup() {

  pinMode(LED_BUILTIN, OUTPUT);
  
  Serial.begin(9600);
  Serial.println("Hallym University 20170926");
}

// the loop function runs over and over again forever
void loop() {
  
}

void serialEvent() {
  while (Serial.available()) {
    
    int v = Serial.read();

    if(v>10 && v <255)
    {
      fadeValue = v;
      analogWrite(ledPin, fadeValue);
      Serial.println((int) fadeValue);
    }
   
    
  }

}



