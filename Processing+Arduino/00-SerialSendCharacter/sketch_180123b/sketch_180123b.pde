import processing.serial.*;
import java.util.StringTokenizer;

Serial myPort;  // The serial port
int keyTyped = 0;
int portnum=-1;

void setup() {
  size(300,300);
  String strOS = System.getProperty("os.name");
  println(strOS);
  
  // List all the available serial ports
  String[] devices = Serial.list();
  printArray(devices);
  
  String portName;
  print(String.format("Found %d devices", devices.length));
  
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
  if(keyTyped>0)
  {
    String buf1 = String.format("%c (%d)", keyTyped, keyTyped);
    text( buf1,10,50);
  }
}


void keyPressed() {
  keyTyped = key;
  if(portnum<0) return;
  
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


// https://stackoverflow.com/a/27833076
private String getLastToken(String strValue, String splitter )  
{        
   String[] strArray = strValue.split(splitter);  
   return strArray[strArray.length -1];            
}
