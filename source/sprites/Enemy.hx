package sprites;

import flixel.FlxSprite;
import openfl.net.SharedObject;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
	public var shot:Shot;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}