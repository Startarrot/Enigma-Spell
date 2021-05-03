package;


import environment.LevelExit;
import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import character.Reach;
import character.Player;
import environment.Gun;
import environment.Interactable;
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
	private var map:FlxOgmo3Loader;
	private var walls:FlxTilemap;
	private var inter:FlxTypedGroup<Interactable>;
	var text:FlxText;
	var background:FlxSprite;

	private var talk:Bool;

	private var levelExit:LevelExit;

	override public function create():Void
	{
		super.create();

		talk = false;

		

		//add level
		map = new FlxOgmo3Loader(AssetPaths.csc303_game_levels__ogmo, AssetPaths.level01__json);
		walls = map.loadTilemap(AssetPaths.wallTile__png, "walls");
		walls.follow();
		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.ANY);
		add(walls);

		player = new Player();
		add(player);

		inter = new FlxTypedGroup<Interactable>();
		inter.add(new Interactable(100,100,"This is a gun.  This is probably the murder weapon.  I should check the body"));
		
		// gun = new Gun(100, 100);
		// add(gun);

		reach = new Reach(player);
		add(reach);

		background = new FlxSprite(0,400).makeGraphic(FlxG.width, 100, FlxColor.BLACK);
		text = new FlxText(0, 400, FlxG.width, 20);
		add(background);
		add(text);
		background.kill();
		text.kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(talk)
			{
				if(FlxG.keys.justPressed.Z)
				{
					disableText(text, player, background);
					talk = false;
				}
			}

			if(FlxG.keys.justPressed.Z && !talk)
				{
					if(FlxG.overlap(reach, inter))
					{
						if(inter.getFound() == false)
						{
							text = inter.fText;
							pickup(text, player, background);
							talk = true;
						}
					}
				}

		
		// FlxG.overlap(hero, doors, openDoor);
		// FlxG.overlap(hero, keys, pickupKey);
		// FlxG.collide(hero, walls);
		// FlxG.collide(hero, doors);
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

	public function pickup(text, player, back)
		{
			back.revive();
			text.revive();
			player.canMove = false;
		}

	public function disableText(text, player, back)
	{
		player.canMove = true;
		text.kill();
		background.kill();
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
