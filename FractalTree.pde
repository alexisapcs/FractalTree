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
	
	drawTree(120, 480, 380, 100, 3*Math.PI/2, 255, 0, 255, 5);
	drawTree(240, 480, 380, 100, 3*Math.PI/2, 255, 0, 0, 5);
	drawTree(360, 480, 380, 100, 3*Math.PI/2, 255, 255, 0, 5);
	drawTree(480, 480, 380, 100, 3*Math.PI/2, 0, 255, 0, 5);
	drawTree(600, 480, 380, 100, 3*Math.PI/2, 0, 255, 255, 5);
  drawTree(720, 480, 380, 100, 3*Math.PI/2, 0, 0, 255, 5);
	drawTree(840, 480, 380, 100, 3*Math.PI/2, 0, 0, 0, 5);
} 
public void keyPressed() {
	if ( key == 'g' ) { 
		draw();
	}
}
public void mousePressed() {
	redraw();

}
public void drawBranches(int x,int y, double branchLength, double angle, int size) {   
	angle *= Math.random()+0.5;
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	branchLength = branchLength*fractionLength;
	strokeWeight(size);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);	
	if ( branchLength < smallestBranch ) {}
	else {
		if(size>1){
			size--;
		}
		drawBranches(endX1,endY1,branchLength-1,3*Math.PI/2, size);
		drawBranches(endX2,endY2,branchLength-1,3*Math.PI/2, size);
	}
} 
public void drawTree(int x, int startY, int endY, int treeLength, double angle, int rColor, int gColor, int bColor, int size) {
	stroke(rColor, gColor, bColor); 
	strokeWeight(size);  
	line(x,startY,x,endY);   
	drawBranches(x,endY,treeLength,angle, size);
}
