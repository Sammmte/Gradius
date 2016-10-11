package sprites;

import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class SmallShip extends Player
{
	private var type:Int;
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic,_type:Int) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(5, 5);
		Reg.bulletMaxExistance += 2;
		Reg.missileMaxExistance++;
		type = _type;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (type == 1){
			x = Reg.xPlayerPositionArray[Reg.firstSmallShip];
			y = Reg.yPlayerPositionArray[Reg.firstSmallShip];
		} else {
			x = Reg.xPlayerPositionArray[Reg.secondSmallShip];
			y = Reg.yPlayerPositionArray[Reg.secondSmallShip];			
		}
		
		checkBulletExistance();
		fire();
	}
	
}