private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .6;  
public void setup() 
{   
  size(500,500);    
  noLoop(); 
} 
public void draw() 
{   
  background(10);
  //strokeWeight(3);
  stroke((float)Math.random()*256, (float)Math.random()*256,(float)Math.random()*256);   
  line(250,300,250,380);   
  drawBranches(250,300,100,3*Math.PI/2); 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  double angle3 = angle;
  branchLength = branchLength*fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  int endX3 = (int)(branchLength*Math.cos(angle3) + x);
  int endY3 = (int)(branchLength*Math.sin(angle3) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  line(x, y, endX3, endY3);
  if(branchLength > smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength-5, angle1);
    drawBranches(endX2, endY2, branchLength-5, angle2);
    drawBranches(endX3, endY3, branchLength-5, angle3);
  }
}    
