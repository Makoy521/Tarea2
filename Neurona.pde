class RNA {
  int ni, nh, nk;
  float []wh,wy;
  float [] bh,by,fh,fy;
  
  float Alfa;
  
  RNA(int n, int k, float Tasa) {
    ni = n;
    nk = k;
    Alfa = Tasa;
    wh = new float[n];
    wy = new float[k];
    bh = new float[k];
    by = new float[k];
    fh = new float[k];
    fy = new float[k];
    Alfa = Tasa;
    
    for (int i=0; i<ni; i++){
        wh[i]= random(1);
        if (i==0)bh[i]=  random(1);
    }
    for (int i=0; i<nh; i++){
        wy[i]= random(1);
        if (i==0)by[i]=  random(1);
    }
  }
  
  void Clasificar(float[] x) 
  {
    float Sum;

     for ( int k=0 ; k < ni ; k++ ){
        Sum = bh[k];
        Sum += x[k]*wh[k];
        fh[k] = f(Sum); //<>//
     }
     for ( int j=0 ; j < nk ; j++ ) {
       Sum = by[j];
       for (int k=0; k < nh ; k++)
         Sum += fh[k]*wy[k];
         fy[j] = f(Sum);
         y[j] = round(fy[j]);
    }       
  }
  
  float f(float Suma) {
    return 1/(1+exp(-Suma));
  }
  float df(float x) {
    return f(x) * (1 - f(x));
  }

  float Entrenar(float[] x, int[] Correcto) {
    float SError = 0;
    float [] dy;

    Clasificar(x);
    dy = new float[K];    //<>//
    for (int j=0; j<nk; j++) {
      // Cambio en la capa de salida 
      float Error = Correcto[j] - y[j];
      dy[j] = Error*df(fy[j]);
      SError += Error*Error;
      // Asignacion
      by[j] += dy[j]*Alfa;
      bh[j] += dy[j]*Alfa;
    }
    // pesos wy
    for (int k=0; k<ni ; k++){
      wy[k] += fh[k]*dy[k]*Alfa;
    }
    // pesos wh
    for ( int k=0; k<ni ; k++){
      if (dy.length<=k)
        wh[k] += x[k]*dy[k]*Alfa;
    }

    return sqrt(SError);
  } //<>//
}
