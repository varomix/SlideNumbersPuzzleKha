package;

import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import tweenx909.TweenX;
import tweenx909.EaseX;

class Block {
	public var x:Int;
	public var y:Int;
	public var width:Int;
	public var height:Int;
	public var color:Color;
	private var image:Image;

	private var moveSpeed:Float = 0.1;

	// TODO: add ID attribute
	public function new(x:Int, y:Int, width:Int, height:Int, ?color:Color, ?img:Image):Void
	{
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.color = color;
		this.image = img;
	}

	public function setImage(img:Image):Void
	{
	    this.image = img;
	}

	public function render(gfx:Graphics):Void
	{
		// if no color provided don't tint it
		if(color != null){
			gfx.color = color; 
		}
		
		// if no image provided just don't draw it
		if(image != null){
			gfx.drawImage(image, this.x,this.y);
		}
	}

	public function onMouseDown(mouseButton:Int, mouseX:Int, mouseY:Int):Void {
		if(mouseButton == 0){
			if (mouseX >= this.x && mouseX <= this.x + this.width && mouseY >= this.y && mouseY <= this.y + this.height){
				// TODO: will run a function that searches and finds the direction to move
				TweenX.to(this, {y:this.y+180}).time(moveSpeed).ease(EaseX.quadInOut);
				trace("it tickles");
			}
		}
	}



}