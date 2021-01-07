//Minim Library: use Sketch / Import Library / Add Library
//Minim Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ungens.*;

// Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //create "play List" variable holding extentions WAV, AIFF, AU, SND, and MP3

void setup() {
  size(500, 400); //fullScreen(), displayWidth & displayHeight, leads to ScreenChecker()
  Minim = new Minim(this); // load from data directory, loadFile should also load from project folder, like loadimage
  
}
 
void draw() {}//End draw()
