import processing.serial.*;
Serial myPort; 
int keyTyped = 0;
int portnum=-1;

String strReceived= null;

void setup() {
  size(400, 300);
 // List all the available serial ports
  String strOS = System.getProperty("os.name");
  println(strOS);
  
  // List all the available serial ports
  String[] devices = Serial.list();
  printArray(devices);
  
  String portName;
  print(String.format("Found %d devices\n", devices.length));
  
  if(System.getProperty("os.name").compareTo("Mac OS X") ==0)
  {  
    // Find something like "/dev/cu.usbmodem14301" or "/dev/tty.usbmodem14301" 
     for (int i = 0; i < devices.length; i++) 
     {
       String dev = devices[i];//getLastToken(devices[i], "/");
       boolean match = dev.matches(".*cu.usbmodem.*");
       
       if(match)
         portnum = i;
       
       print(String.format("%d\t%s\t%b\n", i, dev, match));
     }
    
  } 
  else 
  {
    portnum = 0;
  }
  
  if(portnum>-1)
  {
    portName = devices[portnum];
    print(String.format("Connecting to ... %s @port #%d\n", portName, portnum));
    
    myPort = new Serial(this, portName, 9600);
    myPort.clear();
    println("hello");
  }
  else
  {
    println("Something went wrong ! Check your device !");
  }
  
}

void draw() {
  
  background(255);  
  fill(0);   
  int lf = 10;    // Linefeed in ASCII

  String buf = String.format("%06d", frameCount);
  text(buf, 20,50);
  
  if(strReceived != null)
  {
    buf = String.format("Recv from device: %s", strReceived);
    text(buf, 20,50);
  }
  
  if(keyTyped>0)
  {
    String buf1 = String.format("Sent to device : %c (%d)", keyTyped, keyTyped);
    text( buf1,20,50+20);
  }
  
  
  while (myPort.available() > 0) 
  {
    strReceived = myPort.readStringUntil(lf);//myPort.readString();
 
  }

}
  
  
  

void keyPressed() {
  keyTyped = key;
  if(portnum<0) return;
  
  myPort.write(key);
  
  switch(key)
  {
        
    default:
      break;
      
      
  }
}
