package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.EnemyOne;
import sprites.Ship;
import sprites.Shot;
import sprites.SmallShip;

class PlayState extends FlxState
{
	private var ship:Ship;
	override public function create():Void
	{
		super.create();
		ship = new Ship(3, FlxG.height / 2);
		add(ship);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		if (ship.firstBullet == null && Reg.bulletCount > 0){ Reg.bulletCount--; }
		else if (ship.secondBullet == null && Reg.bulletCount > 0){ Reg.bulletCount--; }
		if (ship.activeMissile == null && Reg.missileCount > 0){ Reg.missileCount--; }
		
		
		if (ship.firstSmallShip != null){
			if (ship.firstSmallShip.firstBullet == null && Reg.bulletCount > 0){ 
				Reg.bulletCount--; 
			} else if (ship.firstSmallShip.secondBullet == null && Reg.bulletCount > 0){ 
				Reg.bulletCount--; 
			}
			
			if (ship.firstSmallShip.activeMissile == null && Reg.missileCount > 0){ Reg.missileCount--; };
		}
		if (ship.secondSmallShip != null){
			if (ship.secondSmallShip.firstBullet == null && Reg.bulletCount > 0){ 
				Reg.bulletCount--; 
			} else if (ship.secondSmallShip.secondBullet == null && Reg.bulletCount > 0){ 
				Reg.bulletCount--; 
			}
			
			if (ship.secondSmallShip.activeMissile == null && Reg.missileCount > 0){ Reg.missileCount--; };
		}
	}

}
