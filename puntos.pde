class Punto{

  float x, y;
  int type;

  Punto (float x, float y,int t){
    this.x=x;
    this.y=y;
    type=t;
  }
  
  Punto (float x, float y){
    this.x=x;
    this.y=y;
  }
  
  void Pintar(){
    strokeWeight(0);   
    switch(type)
    {
      case 1 :
          fill(0,0,255);
        break;
   
      case 2 :
         fill(255,0,0);
        break;
          
       case 0:
          fill(80);
         break;
       default : 
      }
      ellipse(x,y,10,10);
  }
  

}
