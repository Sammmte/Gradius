package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import sprites.Shot;
import sprites.Missile;
import Array;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	public var speed:Int = Reg.playerSpeed;
	public var firstBullet:Shot;
	public var secondBullet:Shot;
	public var activeMissile:Missile;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Submarine2__png, true, 30, 14);
		
		animation.add("sub1", [0], 8, false);
		animation.add("sub2", [1], 8, false);
		animation.add("sub3", [2], 8, false);
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
		if (FlxG.keys.pressed.LEFT && this.x > FlxG.camera.scroll.x+1) { x -= speed; } 
		if (FlxG.keys.pressed.RIGHT && this.x < FlxG.camera.scroll.x+224) { x += speed; } 
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
		if (FlxG.keys.justPressed.X && Reg.bulletCount < Reg.bulletMaxExistance) {
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
			
			if (Reg.activeSkills[1] == 1 && Reg.missileCount < Reg.missileMaxExistance){
				if (activeMissile == null){
					trace("-");
					activeMissile = new Missile(null,null,null,50);
					activeMissile.x = x + width / 2;// / 2;
					activeMissile.y = this.y + height / 2 - activeMissile.height;
					Reg.missileCount++;
					FlxG.state.add(activeMissile);
				}
			}
		}
	}
	
	public function destroyBullet():Void {
		if (firstBullet != null) { firstBullet.destroy(); }
		if (secondBullet != null) { secondBullet.destroy(); }
	}
	
	
	
	public function checkBulletExistance(){
		
		//CHEQUEA QUE LA PRIMERA BALA SE HAYA IDO DE LA PANTALLA
		if (firstBullet != null) {
			if (firstBullet.x + firstBullet.width < 0 || firstBullet.x + firstBullet.width > FlxG.width) {
				Reg.addSkill();
				checkShield();
				firstBullet.destroy();
				//trace(Reg.skillCount);
				firstBullet = null;
			}
		}
		
		//CHEQUEA QUE LA SEGUNDA BALA SE HAYA IDO DE LA PANTALLA
		if (secondBullet != null) {
			if (secondBullet.x + secondBullet.width < 0 || secondBullet.x + secondBullet.width > FlxG.width) {
				Reg.addSkill();
				checkShield();
				secondBullet.destroy();
				//trace(Reg.skillCount);
				secondBullet = null;
			}
		}
		
		//CHEQUEA QUE EL MISIL SE HAYA IDO DE LA PANTALLA
		if (activeMissile != null) {
			if (activeMissile.y + activeMissile.height < 0 || activeMissile.y + activeMissile.height > FlxG.height) {
				activeMissile.destroy();
				activeMissile = null;
			}
		}
		
		//ACA TAMBIEN PODRIA IR EL TEMA DE LA COLISION
	}
	public function checkShield(){
		if (Reg.playerShield > 0){
			if (Reg.playerShield <= 10){
				/*EN ESTE LUGAR TIENE QUE CAMBIAR EL SPRITE PARA QUE PAREZCA QUE EL ESCUDO ESTA A PUNTO DE SER DESTRUIDO*/
				//trace("ESCUDO A PUNTO DE TERMINARSE");
			}
			trace(Reg.playerShield);
			Reg.playerShield -= 10; //CANTIDAD DE VIDA QUE SE LE SACA. ACA TIENE QUE VALIDAR SI COLISIONA CON UNA BALA O UN ENEMIGO
		} else {
			if (Reg.activeSkills[4] == 1){
				/*EN ESTE LUGAR TIENE QUE CAMBIAR EL SPRITE AL ORIGINAL*/
				//trace("ESCUDO DESACTIVADO");
				Reg.activeSkills[4] = 0;
			}
		}
	}
}