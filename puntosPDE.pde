int N=2,K=3;

int maxPuntos = 45;

float alfa = 0.1;

float [] y,x;

Punto[] inPuntos =new Punto[maxPuntos];

Punto Clase1 = new Punto(100,300,1);
Punto Clase2 = new Punto(300,100,3);

int [] ClaseCorrecta;

RNA Cerebro;

void setup(){
  size(400,400);
  
  Cerebro = new RNA(N,K,alfa);
  x = new float[N];
  y = new float[K];
  
  ClaseCorrecta = new int[3];
  
  for ( int i=0 ; i<inPuntos.length ; i++ )
    inPuntos[i] = new Punto(0, 0);
  
}

void draw(){
  background(200);
  noFill();
  strokeWeight(3);
  
  stroke(0, 0, 0); ellipse(100,300,180,180);
  stroke(0, 0,0); ellipse(300,100,180,180);
  
  int DisTrain = 60;
  for ( int i=0 ; i<inPuntos.length ; i++) {
    if(i%2==0){
    inPuntos[i].x = 100+random(-DisTrain,DisTrain); 
    inPuntos[i].y = 300+random(-DisTrain,DisTrain);
    }else{
    inPuntos[i].x = 300+random(-DisTrain,DisTrain); 
    inPuntos[i].y = 100+random(-DisTrain,DisTrain);
    }  
    /*println("puntosx   " + inPuntos[i].x);
    println("puntosy   " + inPuntos[i].y);
    println("puntos tipo   " + inPuntos[i].type);
*/  
}
  
  for (int k =0; k<inPuntos.length; k++) {
      x[0] = inPuntos[k].x/width;
      x[1] = inPuntos[k].y/width;
      
      for(int i=0;i<ClaseCorrecta.length; i++)
        ClaseCorrecta[i] = 0;
        
      if ( dist(inPuntos[k].x,inPuntos[k].y,Clase1.x,Clase1.y)<DisTrain ) //<>//
          ClaseCorrecta[0] = 1;
      else if ( dist(inPuntos[k].x,inPuntos[k].y,Clase2.x,Clase2.y)<DisTrain )
          ClaseCorrecta[1] = 1;
          
      Cerebro.Entrenar(x, ClaseCorrecta);
      
      
      if ( y[0] == 1 && y[1] == 0 && y[2] == 0 ) {
        inPuntos[k].type = 1;
      } else if ( y[0] == 0 && y[1] == 1 && y[2] == 0) {
        inPuntos[k].type =2;
      } else
        inPuntos[k].type =0;
      
      inPuntos[k].Pintar();
  }
}

void keyPressed() 
{
  if ( key == 'p'  ||  key == 'P' ) {
    noLoop();
  }
   if ( key == 's'  ||  key == 'S' ) {
    loop();
  }
  
}
