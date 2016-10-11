package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import states.PlayState;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;


class MenuState extends FlxState
{
	private var player:Player;
	private var ene:EnemyOne;
	private var nivel:FlxTilemap;
	private var tiles1:FlxTilemap;
	public var cameraGuide:FlxSprite;

	override public function create():Void
	{
		super.create();
				
		ene = new EnemyOne();
		
		
		
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level1__oel);		
		nivel = loader.loadTilemap(AssetPaths.Background__png, 16, 16, "Background");
		tiles1 = loader.loadTilemap(AssetPaths.Tiles__png, 16, 16, "Tiles");	
		loader.loadEntities(ponerEntidades, "Player");
		
		cameraGuide = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		cameraGuide.makeGraphic(1, 1, 0x00000000);
		cameraGuide.velocity.x = 50;
		FlxG.camera.follow(cameraGuide);
		player.velocity.x = cameraGuide.velocity.x;
		/*FlxG.camera.follow(player);
		FlxG.camera.deadzone.left = 0;
		FlxG.camera.deadzone.right = 256;
		FlxG.camera.snapToTarget();*/
		FlxG.camera.setScrollBounds(0, nivel.width, 0, nivel.height);
		FlxG.worldBounds.set(0, 0, nivel.width, nivel.height);
		
		
		nivel.setTileProperties(0, FlxObject.NONE, 15);
		tiles1.setTileProperties(1, FlxObject.ANY);
		
		add(cameraGuide);
		add(nivel);
		add(tiles1);
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
		
		FlxG.collide(nivel, player);
		FlxG.collide(tiles1, player);
		
		ene.Movement(player.y);
		super.update(elapsed);
		FlxG.switchState(new PlayState());
	}
	
	private function ponerEntidades(nombreEntidad:String, datosEntidad:Xml):Void
	{
		//if (nombreEntidad == "Player")
		//{
			var X:Float = Std.parseFloat(datosEntidad.get("x"));
			var Y:Float = Std.parseFloat(datosEntidad.get("y"));
		
			player = new Player(3, FlxG.height / 2);
			//player.velocity.x = 64;
		//}
	}
	
	
}
