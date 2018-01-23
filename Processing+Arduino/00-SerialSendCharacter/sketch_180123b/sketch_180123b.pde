import processing.serial.*;

Serial myPort;  // The serial port
int keyTyped = 0;

void setup() {
  size(300,300);
  String strOS = System.getProperty("os.name");
  println(strOS);
  
  // List all the available serial ports
  printArray(Serial.list());
  String portName;
  int portnum=0;
  if(System.getProperty("os.name").compareTo("Mac OS X") ==0)
    portnum = 1;
    
  portName = Serial.list()[portnum];
  println(portName);
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  println("hello");
}

void draw() {
  
  background(255);  
  fill(0);  
  if(keyTyped>0)
  {
    String buf1 = String.format("%c (%d)", keyTyped, keyTyped);
    text( buf1,10,50);
  }
}
void keyPressed() {
  keyTyped = key;
  switch(key)
  {
    case '1': //49
      myPort.write('1');
      
      break;
    
    case '2':
      myPort.write('2');
      
      break;
        
    default:
      break;
      
      
  }
}