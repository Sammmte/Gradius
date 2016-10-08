package sprites;

import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class EnemyOne extends Enemy
{

	public function new() 
	{
		super();
		
		x = FlxG.width;
		y = FlxG.height / 2;
		
		makeGraphic(32, 32);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	public function Movement(yPlayer:Float):Void
	{
		if (y == yPlayer)
		{
			velocity.x = -5;
			velocity.y = 0;
		}
		else 
		{
			velocity.x = 2;
			if (yPlayer > y)
			{
				velocity.y = 2;
			}
			else
			{
				velocity.y = -2;
			}
		}
	}
}