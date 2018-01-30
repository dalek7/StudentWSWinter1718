// Seung-Chan Kim

import processing.serial.*;
Serial myPort; 


void setup() {
 
  size(400, 300);
  
  // List all the available serial ports
  printArray(Serial.list());

  int portnum=1; // 
  if(System.getProperty("os.name").compareTo("Mac OS X") ==0)
    portnum = 1;
    
  String portName = Serial.list()[portnum];
  println(portName);
  
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, portName, 9600);
  // myPort = new Serial(this, Serial.list()[1], 9600);
  
  
}


void draw() {
  
  background(255);  
  fill(0);
  String buf = String.format("cnt : %d", frameCount);
  text(buf, 20,20);
  int i = frameCount % 255;
  myPort.write((char) i);
  
  int lf = 10;    // Linefeed in ASCII
  while (myPort.available() > 0) {
    String str1  = myPort.readStringUntil(lf);//myPort.readString();
       
    if (str1 != null) {
      text("Arduino : "+ str1, 20,40);
    }
  }
  
}