package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.EnemyOne;
import sprites.Player;
import sprites.Shot;

class MenuState extends FlxState
{
	private var player:Player;
	private var ene:EnemyOne;
	
	
	override public function create():Void
	{
		super.create();
		
		player = new Player(3, FlxG.height / 2);
		ene = new EnemyOne();
		
		add(player);
		add(ene);
	}

	override public function update(elapsed:Float):Void
	{
		if (player.firstBullet != null) {
			if (player.firstBullet.x + player.firstBullet.width < 0 || player.firstBullet.x + player.firstBullet.width > FlxG.width) {
				player.firstBullet = null;
				//trace(player.firstBullet);
			}
		}
		if (player.secondBullet != null) {
			if (player.secondBullet.x + player.secondBullet.width < 0 || player.secondBullet.x + player.secondBullet.width > FlxG.width) {
				player.secondBullet = null;
				//trace(player.firstBullet);
			}
		}
		
		
		ene.Movement(player.y);
		super.update(elapsed);
	}
	
	
}
