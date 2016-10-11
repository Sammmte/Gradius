package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Shot extends FlxSprite
{
	public var bulletSpeed:Int = 300;
	//private var bulletSound:FlxSound;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic, ?auxSpeed:Int = 450) 
	{
		super(x, y , SimpleGraphic);
		makeGraphic(3, 1, 0xff00ffff);
		velocity.x += auxSpeed;
		//bulletSound = FlxG.sound.load(AssetPaths.Laser__wav);
		//bulletSound.play();
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		Destruction();
	}
	
	public function Destruction() {
		if (this.x + this.width < FlxG.camera.scroll.x+1 || this.x > FlxG.camera.scroll.x+256) {
			Reg.bulletCount--;
			destroy();
		}
	}
}