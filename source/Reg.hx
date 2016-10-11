package;

/**
 * ...
 * @author roberto
 */
class Reg
{
	public static var playerSpeed:Int = 1;
	public static var bulletCount:Int = 0;
	public static var bulletMaxExistance:Int = 2;
	public static var missileMaxExistance:Int = 1;
	public static var missileCount:Int = 0;
	public static var skillCount:Int = 0;
	public static var activeSkills = new Array<Int>();
	public static var xPlayerPositionArray = new Array<Float>();
	public static var yPlayerPositionArray = new Array<Float>();
	public static var playerShield:Int = 0;
	public inline static var firstSmallShip:Int = 9;
	public inline static var secondSmallShip:Int = 0;
	//public static var fireEnding:Bool = false;
	
	public function new() 
	{
		
	}
	
	public static function addSkill(){
		if (skillCount == 5){
			skillCount = 1;
		} else {
			skillCount++;
		}
	}
	
}