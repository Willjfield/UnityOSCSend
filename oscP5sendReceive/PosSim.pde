class PosSim{
  float location[]; 
  
  PosSim(){
    location = new float[]{0.0,0.0,10.0};
  }
  void update(float x,float y, float z){
    location[0]+=x;
    location[1]+=y;
    location[2]+=z;
  }
  void display(){
    pushMatrix();
    translate(width/2,height/2);
    ellipse(location[0],location[1],location[2],location[2]);
    popMatrix();
  }
}