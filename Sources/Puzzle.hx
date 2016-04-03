package;

import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Assets;
import kha.Image;
import kha.input.Mouse;
import tweenx909.TweenX;
import tweenx909.EaseX;

import Block;
import Group;

class Puzzle {
	
	public var bg:Image;
	public var block:Image;
	public var blockSize:Int = 180;

	public var blk:Block;
	public var blocksGrp:Group;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		// Load all assets
		Assets.loadEverything(create);
	}
	
	private function create(){
		bg = Assets.images.bg2;

		// sample button
		// blk = new Block(24, 188, 180, 180);
		// blk = new Block(0, 0, 180, 180);
		// blk.color = Color.Cyan;
		// blk.setImage(Assets.images.block2);

		// add to grp
		blocksGrp = new Group();
		// blocksGrp.add(blk);

		// trace("length:", blocksGrp.length);

		createBoard();
		blocksGrp.setPosition(24, 188);

		// listen for mouse events
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function createBoard():Void {
		var col:Int = 0;
		var row:Int = 0;

		for (i in 0 ... 15) {
			blk = new Block(col * blockSize, row * blockSize, blockSize, blockSize);
			blk.setImage(Assets.images.block2);

			blocksGrp.add(blk);

			col++;
			if(col >= 4)
			{
				col = 0;
				row++;
			}
		}
		
	}
	
	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {
		var g = framebuffer.g2;
		g.begin();

		// TODO: figure out why we shave to paint white first
		g.color = Color.White;
		// draw background
		g.drawImage(bg, 0,0);

		// add the group
		blocksGrp.render(g);
		
		g.end();		
	}

	var btn:Block;
	public function onMouseDown(button:Int, x:Int, y:Int):Void
	{
		// trace(blocksGrp.length);
		for (i in 0 ... blocksGrp.length) {
			btn = blocksGrp.getBlock(i);
			btn.onMouseDown(button, x, y);
		}
	}
}
