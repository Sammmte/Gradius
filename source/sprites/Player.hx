package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import sprites.Shot;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	public var speed:Int = Reg.playerSpeed;
	public var firstBullet:Shot;
	public var secondBullet:Shot;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Submarine2__png, true, 30, 14);
		
		animation.add("sub1", [0], 8, false);
		animation.add("sub2", [1], 8, false);
		animation.add("sub3", [2], 8, false);
		//makeGraphic(10, 10);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		Controls();
	}
	
	private function Controls():Void
	{
		movement();
	}
	
	private function movement():Void {
		if (FlxG.keys.pressed.LEFT && this.x > 0) { x -= speed; } 
		if (FlxG.keys.pressed.RIGHT && this.x < FlxG.width - this.width) { x += speed; } 
		if (FlxG.keys.pressed.UP && this.y > 0 ) { 
			animation.play("sub2");
			y -= speed;
		}
		if(FlxG.keys.pressed.DOWN && this.y < FlxG.height - this.height) {
			animation.play("sub3");
			y += speed;	
		}
		
		fire();
		
		if (FlxG.keys.justReleased.UP || FlxG.keys.justReleased.DOWN){ animation.play("sub1"); }
	}
	
	private function fire():Void {
		if (FlxG.keys.justPressed.SPACE && Reg.bulletCount < 2) {
			Reg.bulletCount++;
			if(firstBullet == null){
				firstBullet = new Shot(null, null, null, 300);
				//firstBullet.x = this.x + width - firstBullet.width * 2 - (width / 2);
				firstBullet.x = x + width - 5;// / 2;
				//firstBullet.y = this.y + height / 2 - firstBullet.height / 2;
				firstBullet.y = this.y + height / 2 - firstBullet.height;
				FlxG.state.add(firstBullet);
			} else if(secondBullet == null) {
				secondBullet = new Shot(null, null, null, 300);
				secondBullet.x = x + width - 5;// / 2;
				secondBullet.y = this.y + height / 2 - secondBullet.height;
				FlxG.state.add(secondBullet);
			}
		
		}
	}
	
	public function getFirstBullet():Shot {
		return firstBullet;
	}
	
	public function getSecondBullet():Shot {
		return secondBullet;
	}
	
	public function destroyBullet():Void {
		if (firstBullet != null) { firstBullet.destroy(); }
		if (secondBullet != null) { secondBullet.destroy(); }
	}
}