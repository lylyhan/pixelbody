/*
what does it mean to you, my body
if i were to listen to your heartbeat, will i cry
will i still cry
am i listening to the wrong side of your chest
does that make it a gesture for the sake of a gesture
am i really listening, are you?
*/
PFont f;
PImage img,maskImage,img2;
int halfImage;
float a=3;
int gridw,gridh,gridx,gridy;
PImage[] grids;
void setup(){
  img=loadImage("img1.JPG");
  img2=loadImage("img2.JPG");
  f=loadFont("BernardMT-Condensed-48.vlw");
  halfImage=img.width*img.height/2;
  /*
  img.loadPixels();
  for (int i = 0; i < halfImage; i++) {
    img.pixels[i+halfImage] = img.pixels[i];
  }
  img.updatePixels();
  */
  //img.mask(maskImage);
  
  size(700,700);
  background(255);
}

void draw(){
  background(255);
   gridx=5;
   gridy=7;
  
  a=a+1.5*sin(frameCount/100);
  //a=map(noise(-5,5),0,1,0,10);
  //a=map(a,0,1,-5,5);
  //println(a);
  //image(img,0,0,width/2,height);
  //image(img2,0,0,width,height);
  textFont(f,48);
  fill(0);
  text("what is home",mouseX,mouseY);
  text("who are you",width-mouseX,height-mouseY);
  text("can i trust you",width-mouseX/2,height-mouseY/2);
  text("i'm afraid of you",width-mouseX/3,height-mouseY/3);
  //rotate(PI/2);
  
  cutouts();
  int i = 0;
    for (int y = 0; y < gridy; y++){
      for (int x = 0; x < gridx; x++){
        image(grids[i], x*gridw, y*gridh);
        i++;
      }
    }
    pixelchange(a);
}

void cutouts(){
gridw=width/gridx;
gridh=height/gridy;
int gridcount=gridx*gridy;
grids=new PImage[gridcount];
int i=0;
for(int y=0;y<gridy;y++){
for(int x=0;x<gridx;x++){
  int cropx=(int) (mouseX-gridw/2);
  int cropy=(int) (mouseY-gridh/2);
  
  grids[i++]=img2.get(cropx,cropy,gridw,gridh);

}
}



}

void pixelchange(float a){
  
//static pixel changes, in this case lines on top of sketch
loadPixels();
//println("ss",pixels.length);
for (int x = 0; x<width; x+=1) {
  for(int y = 0; y<height; y+=1){
    int loc=(x+(y*width));
    if(x>1){
      
       //pixels[loc]=img.pixels[loc];
    pixels[loc]=int((pixels[loc-1]+pixels[loc])/a);
      
    }
    
}
}
updatePixels();

}
