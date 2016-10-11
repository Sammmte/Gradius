package sprites;

import flixel.FlxG;
import sprites.SmallShip;
/**
 * ...
 * @author ...
 */
class Ship extends Player
{
	public var firstSmallShip:SmallShip;
	public var secondSmallShip:SmallShip;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Submarine2__png, true, 30, 14);
		Reg.activeSkills = [0, 0, 0, 0, 0];
		
		Reg.xPlayerPositionArray = [X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X];
		Reg.yPlayerPositionArray = [Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y];
		
		animation.add("sub1", [0], 8, false);
		animation.add("sub2", [1], 8, false);
		animation.add("sub3", [2], 8, false);
		
	}
	override public function update(elapsed:Float):Void{
		if (FlxG.keys.justPressed.C && (Reg.skillCount != 0 && Reg.skillCount != 3)){
			activateSkill();
			Reg.skillCount = 0;
		}
		movement();
		checkBulletExistance();
		fire();
		
	}
	
	private function movement():Void {
		if (FlxG.keys.pressed.LEFT && this.x > 0) { x -= Reg.playerSpeed; updateArrayPositions(x, y); } 
		if (FlxG.keys.pressed.RIGHT && this.x < FlxG.width - this.width) { x += Reg.playerSpeed; updateArrayPositions(x, y); } 
		if (FlxG.keys.pressed.UP && this.y > 0 ) { 
			animation.play("sub2");
			y -= Reg.playerSpeed;
			updateArrayPositions(x, y);
		}
		if(FlxG.keys.pressed.DOWN && this.y < FlxG.height - this.height) {
			animation.play("sub3");
			y += Reg.playerSpeed;
			updateArrayPositions(x, y);
		}
		
		
		//EN ESTA PARTE CHEQUEAR SI EL OPTION ESTA ACTIVADO QUE REALICE EL MOVIMIENTO PROPIO DEL OPTION
		
		if (FlxG.keys.justReleased.UP || FlxG.keys.justReleased.DOWN){ animation.play("sub1"); }
		
		
	}
	
	public function activateSkill(){
		switch(Reg.skillCount){
			case 1: speedUpSkill();
			case 2: activateMissile();
			case 4: createOption();
			case 5: activateShield();
		}
		Reg.activeSkills[Reg.skillCount-1] += 1;
	}
	
	//BEGIN SKILLS
	public function speedUpSkill(){ Reg.playerSpeed++; }
	
	public function activateMissile(){
		if (Reg.activeSkills[Reg.skillCount-1] != 0){
			Reg.activeSkills[Reg.skillCount-1] = 0;
		}
	}
	public function activateShield(){
		if (Reg.activeSkills[Reg.skillCount-1] == 0){
			trace("ACTIVANDO ESCUDO");
			Reg.playerShield = 50;
		}
	}
	public function createOption(){
		if (Reg.activeSkills[Reg.skillCount - 1] < 2){
			if (Reg.activeSkills[Reg.skillCount - 1] + 1 == 1){
				firstSmallShip = new SmallShip(0, 0,null,1);
				FlxG.state.add(firstSmallShip);
			} else {
				secondSmallShip = new SmallShip(0, 0,null,2);
				FlxG.state.add(secondSmallShip);				
			}
		}
	}
	//END SKILLS
	
	public function updateArrayPositions(x:Float, y:Float){
		
		for (i in 0...Reg.xPlayerPositionArray.length){
			if (i != Reg.xPlayerPositionArray.length-1){
				Reg.xPlayerPositionArray[i] = Reg.xPlayerPositionArray[i + 1];
				Reg.yPlayerPositionArray[i] = Reg.yPlayerPositionArray[i + 1];
			} else {
				Reg.xPlayerPositionArray[i] = x;
				Reg.yPlayerPositionArray[i] = y;
			}
		}
	}
	
}