package;


import environment.LevelExit;
import states.GameOverState;
import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import character.Reach;
import environment.Interactable;
import character.Player;
import environment.Gun;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.FlxSprite;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var player:Player;
	private var reach:Reach;
	private var gun:Gun;
	private var inters:Interactable;
	private var map:FlxOgmo3Loader;
	private var walls:FlxTilemap;
	var text:FlxText;
	var background:FlxSprite;

	private var talk:Bool;

	private var levelExit:LevelExit;

	override public function create():Void
	{
		super.create();

		talk = false;

		background = new FlxSprite(0,400).makeGraphic(FlxG.width, 100, FlxColor.BLACK);

		//add level
		map = new FlxOgmo3Loader(AssetPaths.csc303_game_levels__ogmo, AssetPaths.level01__json);
		walls = map.loadTilemap(AssetPaths.wallTile__png, "walls");
		walls.follow();
		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.ANY);
		add(walls);

		// //add levelExit
		// // levelExit = new LevelExit(270, 430);
		// add(levelExit);
		inters = new Interactable();

		player = new Player();
		add(player);

		gun = new Gun(100, 100);
		add(gun);

		reach = new Reach(player);
		add(reach);

		//inter = new Interactable(gun, reach);
		
		
		
		text = new FlxText(0, 400, FlxG.width, "This is a gun.  This is probably the murder weapon.  I should check the body", 20);
	}

	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);

		// if (ending)
		// 	{
		// 		return;
		// 	}

		// if (FlxG.overlap(player, levelExit))
		if(talk)
			{
				if(FlxG.keys.justPressed.Z)
				{
					talk = false;
					player.canMove = true;
					text.destroy();
					background.destroy();
					background = new FlxSprite(0,400).makeGraphic(FlxG.width, 100, FlxColor.BLACK);
					text = new FlxText(0, 400, FlxG.width, "This is a gun.  This is probably the murder weapon.  I should check the body", 20);
				}
			}

		// if (FlxG.overlap(hero, levelExit))
		// 	{
		// 		ending = true;
		// 		won = true;
		// 		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, doneFadeOut);
		// 	}
		if(FlxG.keys.justPressed.Z)
		{
			if(FlxG.overlap(reach, gun))
			{
				if(gun.isFound == false)
					talk = gunPickup(text, player, talk, background);
			}
		}
		// FlxG.overlap(hero, doors, openDoor);
		// FlxG.overlap(hero, keys, pickupKey);
		// FlxG.collide(hero, walls);
		// FlxG.collide(hero, doors);


		if(FlxG.keys.justPressed.X)
			talk = gunPickup(text, player, talk, background);
	}

	// private function doneFadeOut()
	// {
	// 	FlxG.switchState(new states.GameOverState());	
	// }

	// private function interact(gun:Gun)
	// {
	// 	if(gun.found == false)
	// 		gun.isFound();
	// }

	public function gunPickup(text, player, talk, back)
		{
			add(back);
			
			add(text);

			player.canMove = false;
			return talk = true;
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
