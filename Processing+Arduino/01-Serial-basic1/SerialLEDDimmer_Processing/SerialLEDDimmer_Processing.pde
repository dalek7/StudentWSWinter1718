// Seung-Chan Kim

import processing.serial.*;
Serial myPort; 


void setup() {
 
  size(400, 300);
  // List all the available serial ports
  printArray(Serial.list());

  int portnum=0;
  if(System.getProperty("os.name").compareTo("Mac OS X") ==0)
    portnum = 1;
    
  portName = Serial.list()[portnum];
  println(portName);
  
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, portName, 9600);
  // myPort = new Serial(this, Serial.list()[1], 9600);
  
  
}


void draw() {
  
  background(255);  
  fill(0);
  
  while (myPort.available() > 0) {
    int aByte  = myPort.read();
    String inBuffer = myPort.readString();   
    if (inBuffer != null) {
      //println("Arduino : "+ inBuffer, 20,40);
      text("Arduino : "+ inBuffer, 20,40);
    }
    
      
  }
  String buf = String.format("cnt : %d", frameCount);
  text(buf, 20,20);
  int i = frameCount % 255;
  
  myPort.write((char) i);
  
}