import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.widget.Toast;
import android.view.Gravity;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

import java.util.UUID;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import android.util.Log;

float baseline;
float amp = 5;
float []y = new float[5];
float []x = new float[5];
boolean ti = false, lock=false;
boolean []item = {true, false, false};
boolean []hr = {false, false, true, false, false};
String []menu ={"Home", "User", "Setting"};
String con="disconnect";
float r, m, an;
float []a= new float[5];
float []b= new float[5];
int tr, h, def=570, day=3, h_1=0, h_2=0, m_1=0, m_2=0, c_1=0, c_2=0, c_0=0, yOffset=0;
float []rad={100, 100, 120, 150, 150};
PImage []icon=new PImage[3];
String[] week={"Sun", "Mon", "Tue", "Wed", "Thu", "Fri","Sat"};
int []time={2, 3, 4, 5, 6};
Boolean []calender= new Boolean [35];


/* DiscoverBluetooth: Written by ScottC on 18 March 2013 using 
 Processing version 2.0b8
 Tested on a Samsung Galaxy SII, with Android version 2.3.4
 Android ADK - API 10 SDK platform */


//boolean foundDevice=false; //When this is true, the screen turns green.

//Get the default Bluetooth adapter


void setup() {
  size(710, 1270);
  for (int i=0; i<5; i++) {
    x[i]=355;
    y[i]=635;
    a[i]=355;
    b[i]=635;
  }
  icon[0]=loadImage("home.png") ;
  icon[1]=loadImage("user.png") ;
  icon[2]=loadImage("setting.png") ;
  for(int i=0;i<35;i++){
    calender[i]=false;
  }
}
void draw() {

  background(255);
  smooth();
  
  baseline = 830-m*5/3;

  fill(245);
  noStroke();
  rect(0, 1170, 710, 100);

  textSize(25);

  fill(0, 0, c_0);
  text(menu[0], 100, 1265);
  fill(0, 0, c_1);
  text(menu[1], 340, 1265);
  fill(0, 0, c_2);
  text(menu[2], 540, 1265);

  tint(0, 0, c_0);
  image(icon[0], 110, 1195, 40, 40);
  tint(0, 0, c_1);
  image(icon[1], 340, 1195, 40, 40);
  tint(0, 0, c_2);
  image(icon[2], 560, 1195, 40, 40);

  fill(220);
  rect(0,0,710,100);
  if (item[0]) {

    r=400;
    tr=80;
    c_0=139;
    c_1=0;
    c_2=0;

    textSize(25); 
    fill(200);
    text(con, 290, 300);
    fill(0,0,139);
    textSize(45); 
    text("NEQ",310,70);
    if (ti) {

      fill(238, 99, 99);//red
      ellipse(x[0], y[0], rad[0], rad[0]);
      y[0]=y[0]-20;
      if (y[0]<= 435) {
        y[0]=435;
      }

      fill(255, 165, 79);//orange
      ellipse(x[1], y[1], rad[1], rad[1]);
      x[1]=x[1]+20;
      if (x[1]>=555) {
        x[1]=555;
      }
      y[1]=y[1]-4;
      if (y[1]<= 595) {
        y[1]=595;
      }

      fill(118, 238, 30);//green
      ellipse(x[2], y[2], rad[2], rad[2]);
      x[2]=x[2]-20;
      if (x[2]<=155) {
        x[2]=155;
      }
      y[2]=y[2]-4;
      if (y[2]<= 595) {
        y[2]=595;
      }

      fill(192, 255, 62);//greenyellow
      ellipse(x[3], y[3], rad[3], rad[3]);
      x[3]=x[3]-10;
      if (x[3]<=255) {
        x[3]=255;
      }
      y[3]=y[3]+20;
      if (y[3]>= 835) {
        y[3]=835;
      }
      fill(255, 193, 37);//yellow
      ellipse(x[4], y[4], rad[4], rad[4]);
      x[4]=x[4]+10;
      if (x[4]>=455) {
        x[4]=455;
      }
      y[4]=y[4]+20;
      if (y[4]>= 835) {
        y[4]=835;
      }
    }
    if (!ti) {
      tr=255;
      fill(238, 99, 99);//red
      ellipse(x[0], y[0], rad[0], rad[0]);
      y[0]=y[0]+20;
      if (y[0]>=635) {
        y[0]=635;
      }

      fill(255, 165, 79);//orange
      ellipse(x[1], y[1], rad[1], rad[1]);
      x[1]=x[1]-20;
      if (x[1]<=355) {
        x[1]=355;
      }
      y[1]=y[1]+4;
      if (y[1]>= 635) {
        y[1]=635;
      }

      fill(118, 238, 30);//green
      ellipse(x[2], y[2], rad[2], rad[2]);
      x[2]=x[2]+20;
      if (x[2]>=355) {
        x[2]=355;
      }
      y[2]=y[2]+4;
      if (y[2]>= 635) {
        y[2]=635;
      }

      fill(192, 255, 62);//greenyellow
      ellipse(x[3], y[3], rad[3], rad[3]);
      x[3]=x[3]+10;
      if (x[3]>=355) {
        x[3]=355;
      }
      y[3]=y[3]-20;
      if (y[3]<= 635) {
        y[3]=635;
      }
      fill(255, 193, 37);//yellow
      ellipse(x[4], y[4], rad[4], rad[4]);
      x[4]=x[4]-10;
      if (x[4]<=355) {
        x[4]=355;
      }
      y[4]=y[4]-20;
      if (y[4]<= 635) {
        y[4]=635;
      }
    }

    fill(255, 255, 255, tr);
    ellipse(355, 635, r, r);
    fill(230, 230, 230, tr);
    ellipse(a[0], b[0], r, r);

    fill(152, 245, 255);
    beginShape();
    curveVertex(355-sqrt((400-m*5/3)*m*5/3), 835-m*5/3);
    curveVertex(355-sqrt((400-m*5/3)*m*5/3), 835-m*5/3);
    curveVertex(355-sqrt((400-m*5/3)*m*5/3), baseline + amp * sin(0.05 * frameCount));
    for (int i = 0; i < 10; i++) {
      float x, y;
      x = 355-sqrt((400-m*5/3)*m*5/3) + i * sqrt((400-m*5/3)*m*5/3)*2 / 9;
      y = baseline + amp * sin(0.05 * frameCount + i * PI / 2);
      curveVertex(x, y);
    }
    curveVertex(355+sqrt((400-m*5/3)*m*5/3), baseline + amp * sin(0.05 * frameCount + 9 * PI / 2));
    curveVertex(355+sqrt((400-m*5/3)*m*5/3), 835-m*5/3);
    curveVertex(355+sqrt((400-m*5/3)*m*5/3), 835-m*5/3);
    endShape();
    an=acos((200-m*5/3)/200);
    stroke(230, 230, 230);
    strokeWeight(1);
    arc(355, 635, 400, 400, PI/2-an, PI/2+an, OPEN);

    textSize(45);
    fill(0, 0, 139);
    m = millis()/60000;
    h = (10*m_1+m_2)/60;
    m_1 = (int)m / 10;
    m_2 = (int)m % 10;
    h_1 = h / 10;
    h_2 = h % 10;
    text(h_1+""+h_2+":"+m_1+""+m_2, 300, 645);
  }


  if (item[1]) {

    c_1=139;
    c_0=0;
    c_2=0;
    fill(0,0,139);
    textSize(45); 
    text("17 March, 2017",230,70);
    
    fill(200);
    stroke(200);
    strokeWeight(4);
    rect(40,240,630,60);
    textSize(30);
    
    for (int k=0;k<7;k++){
      fill(255);
      text(week[k],60+90*k,285);  
    }
    
    for (int l=0; l<7; l++) {
        for (int m=0; m<5; m++) {
        fill(255);
        stroke(200);
        rect(40+90*l, 300+90*m, 90, 90);
        if (7*m+l+1<=30) {
          fill(100);
          textSize(30);
          if (7*m+l+1 == day()) {
            fill(0, 0, 139);
           }
          text(7*m+l+1, 70+90*l, 360+90*m);
         }
      if(calender[7*m+l]){
        noFill();
        stroke(0,0,139);
        rect(42+90*l, 302+90*m, 84, 84);
      }
    }
  }
 }
  if (item[2]) {
    
    c_1=0;
    c_0=0;
    c_2=139;
    fill(0,0,139);
    textSize(45); 
    text("Goal",310,70);

    fill(200);
    for (int i=0; i<5; i++) {
      fill(200);
      if (hr[i]) {
        fill(0, 0, 139);
      }
      text(time[i], 350, def+60*i);
    }
    stroke(200);
    strokeWeight(2);
    line(200, 640, 500, 640);
    line(200, 700, 500, 700);
    fill(0, 0, 139);

    textSize(20);
    text("hours", 420, 690);
    text("less than", 230, 690);
  }
  
}



void mousePressed() {
  if (dist(mouseX, mouseY, width/2, height/2)<r) {
    ti=!ti;
  }
  if (mouseX>0 && mouseX <200 && mouseY>1170 && mouseY<1270) {
    item[0]= true;
    item[1]= false;
    item[2]= false;
  }
  if (mouseX>200 && mouseX <400 && mouseY>1170 && mouseY<1270) {
    item[0]= false;
    item[1]= true;
    item[2]= false;
  }
  if (mouseX>400 && mouseX <600 && mouseY>1170 && mouseY<1270) {
    item[0]= false;
    item[1]= false;
    item[2]= true;
  }
  for(int i=0;i<7;i++){
    for(int j=0;j<5;j++){   
      if (mouseX>(40+90*i)&&mouseX<(130+90*i)&&mouseY>(300+90*j)&&mouseY<(390+90*j)){
         calender[7*j+i]=!calender[7*j+i];
      }
      else{
        calender[7*j+i]=false;;
      }
   }
  }
  lock= true;
  yOffset = mouseY - def;

}

void mouseDragged() {
  if (lock) {
    def = mouseY-yOffset;
    if (def<450) {
      def=450;
    }
    if (def>690) {
      def=690;
    }
    for (int i=0; i<5; i++) {
      hr[i]=false;
      if (def>=690-60*i && def<750-60*i) {
        hr[i]=true;
      }
    }
  }
}

void mouseReleased() {
  lock=false;
  for (int i=0; i<5; i++) {
    if (hr[i]) {
      def = 690-60*i;
    }
  }
}