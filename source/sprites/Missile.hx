package sprites;

import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Missile extends FlxSprite
{
	public var bulletSpeed:Int = 300;
	//private var bulletSound:FlxSound;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic, ?auxSpeed:Int = 250) 
	{
		super(x, y , SimpleGraphic);
		makeGraphic(3, 1, 0xff00ffff);
		velocity.x += auxSpeed;
		velocity.y += auxSpeed;
		//bulletSound = FlxG.sound.load(AssetPaths.Laser__wav);
		//bulletSound.play();
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		Destruction();
	}
	
	public function Destruction() {
		if (this.y + this.height < 0 || this.y + this.height > FlxG.height) {
			trace("Destruido");
			//Reg.missileCount--;
			//Reg.bulletCount--;
			destroy();
		}
	}
	
}