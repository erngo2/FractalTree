private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .25;  

double  brLen = 1;
public void setup() 
{   
	size(740,580);    
	//noLoop(); 
	background(10);
	frameRate(60);
} 

public void draw() 
{      
	//if(frameCount % 10 == 0)
	background(10, 10, 10, 10);
	stroke(78, 250, 42, 160);  
	//if(frameCount % 5 == 0)
	drawTrees(370, 580, 370, 480, brLen, 3 * Math.PI / 2); 
	if(brLen <= 125 && frameCount % 3 == 0)
		brLen++;
} 

public void mousePressed()
{
	if(mouseButton == LEFT)
		noLoop();
	if(mouseButton == RIGHT)
		brLen = 0;
}

public void mouseReleased()
{
	if(mouseButton == LEFT)
		loop();
}

public void keyPressed()
{
	if(keyCode == LEFT)
		branchAngle -= 0.005;
	if(keyCode == RIGHT)
		branchAngle += 0.005;
}

double temp = 1;
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y);
	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
		
	}
} 

public void drawTrees(int x, int y, int x1, int y1, double branchLength, double angle)
{
	line(x, y, x1, y1);   
	drawBranches(x1, y1, branchLength, angle);
}