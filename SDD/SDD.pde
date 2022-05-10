PImage img;
int[][] Linear = new int[1000000][4];
int[][] Poly = new int[10000000][6];
int threshhold = 2;
int tolerence = 2;
int[][] Image = new int[pixelWidth][pixelHeight];
void setup(){
  size(1000,1000); //<>//
  img = loadImage("joe.jpg");
  image(img,0,0);  
  filter(GRAY);
  loadPixels();
     Linear=LinearEdge(pixels);
     clear();
  fill(0);
     LinearDraw();



 
  

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
  
  for(int i = 0; i<pixels.length-(pixelHeight*tolerence); i+=1){
  
  for(int j = 1; j < tolerence; j++){
   for( int h = 1; h < tolerence; h++){
     
    if(pixels[i]>color(100)&&pixels[i]<color(240)){
      if(pixels[i]>pixels[i+(j*pixelHeight)+h]+color(threshhold)&&pixels[i]<pixels[i+(j*pixelHeight)+h]-color(threshhold)){
      
      Linear[counter][0] = floor(i/pixelHeight);
      Linear[counter][1] =  i%pixelWidth;
      Linear[counter][2] = floor((i+j)/pixelHeight);
      Linear[counter][3] = (i%pixelWidth)+h;
      counter+=1;
      
    }  //<>//
    }
     
   }
   
    
  }
  
  }
  return  Linear;
}

void LinearDraw(){
  
 for( int i = 0; i<Linear.length; i++){
   
  line(Linear[i][1], Linear[i][0], Linear[i][3], Linear[i][2]); 
   stroke(255);
 }
  
}

int[][] Polyedge(int[] pixels[]){
  int x = int(random(0,pixelWidth));
  int y = int(random(0,pixelHeight));
  int pos = pixelHeight*y+x;
  int counter = pos+1;
  int w = color(255);
  int b = color(0);
  while pos =! counter{
    
    int[] matrix = new int[4]
    matrix = [pixels[i], pixels[i+1], 
    pixels[i+pixelHeight], pixels[i+pixelHeight+1]]
    
    switch(matrix){
      
     case [w,w,w,w]:
     Poly=Polyedge(pixels[]);
     break;
     
     case [w,w,w,b]:
     pos = pixels[i+1];
     
     case [b,w,w,w]:
     pos = pixels[i-pixelHeight];
     
     case [w,b,w,w]:
     pos = pixels[i+1];
     
     case[w,w,b,w]:
     pos = pixels[i-1];
     
     case[b,b,w,w]
  
         
      
    }
    
  }
  
  return pixels;
  
}

void Polydraw(){
  
  
  
}

void exportasPDF(){
  
  
  
}

void exportasSVG(){
  
  
  
}
