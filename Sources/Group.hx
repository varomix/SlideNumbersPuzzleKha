package;

import kha.graphics2.Graphics;
import Block;

class Group {
	
	private var x:Int;
	private var y:Int;

	public var group:Array<Block>;

	public var length(get, null):Int;

	public function new(X:Int = 0, Y:Int = 0):Void
	{
	    this.x = X;
	    this.y = Y;
	    this.group = new Array<Block>();
	}

	function update(): Void {
		for (block in group) {
			block.x += this.x;
			block.y += this.y;
		}
	}

	public function render(gfx:Graphics):Void
	{
		for (block in group) {
			block.render(gfx);
		}
	}

	public function add(block:Block):Block
	{
	    group.push(block);
	    this.update();
	    return block;
	}

	public function setPosition(X:Int, Y:Int):Void
	{
	    this.x = X;
	    this.y = Y;

	     this.update();
	}

	// GROUP FUNCTIONS
	private inline function get_length():Int
	{
		return group.length;
	}
}