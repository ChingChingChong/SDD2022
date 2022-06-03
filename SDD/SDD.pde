PImage img; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
IntList Linear= new IntList();
IntList Poly = new IntList();
int threshhold = 2;
int tolerence = 2;
int[] choices = new int[16];

void setup() {
  print(color(0, 0, 0), color(255, 255, 255));
  size(1000, 1000);
  img = loadImage("joe2.png");




  image(img, 0, 0);
  filter(GRAY);
  loadPixels();
  Linear=LinearEdge(pixels);
  clear();
  fill(0);
  LinearDraw();
  loadPixels();
 // clear();
  //fill(0);
  print(pixels.length);

  //Poly = Polyedge(pixels, choices);
  print("joe");
  //Polydraw();
}


void draw() {
}


IntList LinearEdge(int[] pixels) {



  for (int i = 0; i<pixels.length-(pixelHeight*tolerence); i+=1) {

    for (int j = 1; j < tolerence; j++) {
      for ( int h = 1; h < tolerence; h++) {

        if (pixels[i]>color(100)&&pixels[i]<color(240)) {
          if (pixels[i]>pixels[i+(j*pixelHeight)+h]+color(threshhold)&&pixels[i]<pixels[i+(j*pixelHeight)+h]-color(threshhold)) {

            Linear.append(i%pixelHeight);
            Linear.append( floor(i/pixelHeight));
            Linear.append((i%pixelHeight)+h);
            Linear.append(floor((i+j)/pixelHeight));
          }
        }
      }
    }
  }
  return  Linear;
}

void LinearDraw() {

  for ( int i = 0; i<Linear.size()-4; i+=4) {

    line(Linear.get(i), Linear.get(i+1), Linear.get(i+2), Linear.get(i+3));
    stroke(255);
  }
  loadPixels();
}

IntList Polyedge(int[] pixels, int[] choices) {
  int pos = int(random(0, pixels.length-pixelHeight-1));
  int counter = pos+1;
  int bit = 0;
  int initpos = pos;
  int black = 0;
  int recorded = 0;

  choices[0] = int(random(0, pixels.length-pixelHeight-1));

  choices[1] = pos-pixelHeight;
  choices[2] = pos-1;
  choices[3] = pos-1;
  choices[4] = pos+1;
  choices[5] = pos + pixelHeight;
  choices[6] = pos +1;
  choices[7] = pos-pixelHeight+1;
  choices[8] = pos-pixelHeight;
  choices[9] = pos-pixelHeight;
  choices[10] = pos - pixelHeight;
  choices[11] = pos - 1;
  choices[12] = pos + 1;
  choices[13] = pos+1;
  choices[14] = pos + 1+pixelHeight;
  choices[15] = int(random(0, pixels.length-pixelHeight-1));
  while (recorded <20) { //<>//

    while (counter != initpos) {


      int[] matrix = new int[4];
      matrix[0] = abs(int(pixels[pos]/16777216));
      matrix[1] = abs(int(pixels[pos+1]/16777216));
      matrix[2] = abs(int(pixels[pos+pixelHeight]/16777216));
      matrix[3] = abs(int(pixels[pos+1+pixelHeight]/16777216));

      bit = (matrix[0]<<3)+(matrix[1]<<2)+(matrix[2]<<1)+(matrix[3]<<0);

      while (bit ==15||bit == 0) { //<>//
        pos =int(random(0, pixels.length-pixelHeight-1));
        matrix[0] = int(pixels[pos]/-16777216);
        matrix[1] = int(pixels[pos+1]/-16777216);
        matrix[2] = int(pixels[pos+pixelHeight]/-16777216);
        matrix[3] = int(pixels[pos+1+pixelHeight]/-16777216);
        bit = (matrix[0]<<3)+(matrix[1]<<2)+(matrix[2]<<1)+(matrix[3]<<0);
        initpos = pos;
        
      }
      if (bit!=15 && bit!=0) {

        if (choices[bit]<pixels.length-pixelHeight-1) {
          pos =choices[bit];
          Poly.append(pos%pixelHeight);
          Poly.append(floor(pos/pixelHeight));
        }
      }


      choices[0] = int(random(0, pixels.length-pixelHeight-1));

      choices[1] = pos-pixelHeight;
      choices[2] = pos-1;
      choices[3] = pos-1;
      choices[4] = pos+1;
      choices[5] = pos + pixelHeight;
      choices[6] = pos +1;
      choices[7] = pos-pixelHeight+1;
      choices[8] = pos-pixelHeight;
      choices[9] = pos-pixelHeight;
      choices[10] = pos - pixelHeight;
      choices[11] = pos - 1;
      choices[12] = pos + 1;
      choices[13] = pos+1;
      choices[14] = pos + 1+pixelHeight;
      choices[15] = int(random(0, pixels.length-pixelHeight-1));
      counter = pos;
    }
    pos = int(random(0, pixels.length));
    int x = pos%pixelHeight;
    int y = floor(pos/pixelHeight);
    for (int i = 0; i<Poly.size()-1; i++) {

      if ( x == Poly.get(i)&& y == Poly.get(i+1)) {

        recorded+=1;
      
      }
    }
  }
  return Poly;
}


void Polydraw() {
  for (int i = 0; i<Poly.size()-8; i+=8) { //<>//
    
    bezier(Poly.get(i), Poly.get(i+1), Poly.get(i+2), Poly.get(i+3), Poly.get(i+4), Poly.get(i+5), Poly.get(i+6), Poly.get(i+7));
    
  }
}

void exportasPDF() {
}

void exportasSVG() {
}
