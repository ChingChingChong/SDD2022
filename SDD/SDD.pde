PImage img;
int[][] Linear = new int[10000000][4];
int[][] Poly = new int[10000000][6];
int threshhold = 5;
int tolerence = 2;
int[][] Image = new int[pixelWidth][pixelHeight];
void setup(){
  size(1000,1000);
  img = loadImage("joe.jpg");
  
  image(img,0,0);
  filter(GRAY);
  loadPixels();
  addrowtopixel();
  Linear=LinearEdge(pixels);
  for(int i = 0; i<pixels.length; i++){
   print(Linear[i][0]);
   print(Linear[i][1]);
      print(Linear[i][2]);
   print(Linear[i][3]);
  }
}


void draw(){
  
  
  
}

void addrowtopixel(){
  
 for(int i = 0; i<pixelHeight; i++){
   
  append(pixels, 0); 
   
 }
 print(pixels.length);
  
}

int[][] LinearEdge(int[] pixels){
  
  int counter = 0;
  
  for(int i = 0; i<pixels.length-1; i+=1){
  
  for(int j = 0; j < tolerence; j++){
   for( int h = 0; h < tolerence; h++){
     
    if(pixels[i+pixelHeight*j+h]+threshhold <= pixels[i]||pixels[i+pixelHeight*j+h]-threshhold >= pixels[i]){
      
      Linear[counter][0] = floor(i/pixelWidth);
      Linear[counter][1] =  i%pixelHeight;
      Linear[counter][2] = floor((i+j)/pixelWidth);
      Linear[counter][3] = (i+h)%pixelHeight;
      for( int k = 0;k < 4; k++){
        
       print(i,"joe");
       println(i+pixelHeight*j+h);
        
      }
      counter+=1;
      
    }  //<>//
     
   }
   
    
  }
  
  }
  return  Linear;
}

void LinearDraw(){
  
 
  
}

int[][] Polyedge(int[] pixels[]){
  
  return pixels;
  
}

void Polydraw(){
  
  
  
}

void exportasPDF(){
  
  
  
}

void exportasSVG(){
  
  
  
}
