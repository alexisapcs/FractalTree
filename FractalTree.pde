PImage back;
private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
public void setup() {   
	size(960,480);    
	//frameRate(10);
	back = loadImage("windowsBG.jpg");
	noLoop(); 
} 
public void draw() {   
	image(back, 0, 0);   
	stroke(0,255,0);   
	line(640,480,640,380);   
	drawBranches(640,380,100,3*Math.PI/2);
	stroke(255,0,0);   
	line(640,480,640,380);   
	drawBranches(640,380,100,3*Math.PI/2);
	drawTree(640, 480, 380, 100, 3*Math.PI/2, 0, 0, 255);
	drawTree(320, 480, 380, 100, 3*Math.PI/2, 255, 0, 255);
	drawTree(320, 480, 380, 100, 3*Math.PI/2, 0, 255, 255);
	drawTree(320, 480, 380, 100, 3*Math.PI/2, 255, 255, 0);

} 
public void keyPressed() {
	if ( key == 'g' ) { 
		draw();
	}
}
public void mousePressed() {
	redraw();

}
public void drawBranches(int x,int y, double branchLength, double angle) {   
	angle *= Math.random()+0.5;
	double angle1 = angle + branchAngle*fractionLength;
	double angle2 = angle - branchAngle*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);;

	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);	
	if ( branchLength < smallestBranch ) {}
	else {
		drawBranches(endX1,endY1,branchLength-12,3*Math.PI/2);
		drawBranches(endX2,endY2,branchLength-12,3*Math.PI/2);
	}
} 
public void drawTree(int x, int startY, int endY, int treeLength, double angle, int rColor, int gColor, int bColor) {
	stroke(rColor, gColor, bColor);   
	line(x,startY,x,endY);   
	drawBranches(x,endY,treeLength,angle);
}