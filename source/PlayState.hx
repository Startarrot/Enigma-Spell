package;


import environment.LevelExit;
import states.GameOverState;
import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import character.Item;
import character.Player;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;

class PlayState extends FlxState
{
	private var player:Player;
	private var reach:Item;

	private var map:FlxOgmo3Loader;
	private var walls:FlxTilemap;
	private var ending:Bool;
	private var won:Bool;

	private var levelExit:LevelExit;

	override public function create():Void
	{
		super.create();


		//add level
		map = new FlxOgmo3Loader(AssetPaths.csc303_game_levels__ogmo, AssetPaths.level01__json);
		walls = map.loadTilemap(AssetPaths.wallTile__png, "walls");
		walls.follow();
		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.ANY);
		add(walls);

		//add levelExit
		levelExit = new LevelExit(270, 430);
		add(levelExit);


		player = new Player();
		add(player);
		
		reach = new Item(player);
		add(reach);
		
	}

	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);

		if (ending)
			{
				return;
			}

		// if (FlxG.overlap(hero, levelExit))
		// 	{
		// 		ending = true;
		// 		won = true;
		// 		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, doneFadeOut);
		// 	}
		

		// FlxG.overlap(hero, doors, openDoor);
		// FlxG.overlap(hero, keys, pickupKey);
		// FlxG.collide(hero, walls);
		// FlxG.collide(hero, doors);
	}

	private function doneFadeOut()
	{
		FlxG.switchState(new states.GameOverState());	
	}

	// // Opens locked doors if you have a key
	// private function openDoor(hero:Hero, door:Door)
	// 	{
	// 		if(totalKeys.getKey() > 0)
	// 			{
	// 				totalKeys.useKeys();
	// 				door.openDoor();
	// 			}
	// 	}
}
