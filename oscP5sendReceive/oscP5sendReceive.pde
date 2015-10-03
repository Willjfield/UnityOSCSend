import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;
PosSim p;

void setup() {
  size(400,400);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  //ENTER THE IP ADDRESS OF THE VR PHONE
  myRemoteLocation = new NetAddress("192.168.2.2",12000);
  
  p=new PosSim();
}

void draw() {
  background(0);  
  p.display();
}

void keyPressed() {
   OscMessage myMessage = new OscMessage("/dir");
  if (key == CODED) {
    if (keyCode == UP) {
      p.update(0.0,-1.0,0.0);
      myMessage.add(p.location);
    } else if (keyCode == DOWN) {
      p.update(0.0,1.0,0.0);
      myMessage.add(p.location);
    } else if (keyCode == RIGHT) {
       p.update(1.0,0.0,0.0);
      myMessage.add(p.location);
    } else if (keyCode == LEFT) {
      p.update(-1.0,0.0,0.0);
      myMessage.add(p.location);
    } else if (keyCode == SHIFT) {
      p.update(0.0,0.0,1.0);
      myMessage.add(p.location);
    } else if (keyCode == CONTROL) {
      p.update(0.0,0.0,-1.0);
      myMessage.add(p.location);
    } 
  }
  oscP5.send(myMessage, myRemoteLocation); 
}
/*
void oscEvent(OscMessage theOscMessage) {
  String firstValue = theOscMessage.get(0).stringValue();
  println(firstValue);
}
*/