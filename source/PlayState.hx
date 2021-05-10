package;

import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import character.Reach;
import character.Player;
import environment.Interactable;
import environment.Inventory;
import environment.MessageTree;
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
	private var map:FlxOgmo3Loader;
	private var walls:FlxTilemap;
	private var inter:FlxTypedGroup<Interactable>;
	var text:FlxText;
	var background:FlxSprite;
	var inv:Inventory;
	var display:FlxText;
	var message:MessageTree;

	private var talk:Bool;

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
		inter.add(new Interactable(100,100,"This is a gun.  This is probably the murder weapon.  I should check the body.",0));
		inter.add(new Interactable(200,100,"Definitly a dead body. Shot in his high rise office.  Really feel sorry for him.",1));
		inter.add(new Interactable(300,100,"Door doesn't look busted in.  Whoever did this was let in.",2));
		inter.add(new Interactable(400,100,"An account book?  Some of it's pages have been torn out!",3));
		inter.add(new Interactable(500,100,"The report says he was shot in the back with a necrosis bullet. I hate rot magic.  My life is rotten enough without it.",4));
		add(inter);

		reach = new Reach(player);
		add(reach);

		background = new FlxSprite(0,400).makeGraphic(FlxG.width, 100, FlxColor.BLACK);
		text = new FlxText(0, 400, FlxG.width, 20);
		add(background);
		add(text);
		background.kill();
		text.kill();

		inv = new Inventory();
		add(inv);
		message = new MessageTree();
		add(message);
		display = new FlxText(550, 0, 150, "", 20);
        add(display);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if(inv.beenFound)
		{
			display.text = inv.display;
		}

		var finishedTalking = false;
		if(talk)
		{
			if(FlxG.keys.justPressed.Z)
			{
				disableText(text, player, background);
				talk = false;
				finishedTalking = true;
			}
		}

		if(FlxG.keys.justPressed.Z && !talk && !finishedTalking)
		{
			FlxG.overlap(reach, inter, interText);
		}
	}

	public function pickup(text, player, back)
		{
			back.revive();
			text.revive();
			player.canMove = false;
		}

	public function interText(reach:Reach, inter:Interactable):Void
	{
		talk = true;
		if(inter.found == false)
		{
			text.text = inter.fText;
			pickup(text, player, background);
			inter.found = true;
			inv.foundItem(inter.num);
		}
		else
		{
			text.text = message.checkDialoge(inter.num,inv.selection);
			pickup(text, player, background);
		}
		
	}

	public function disableText(text, player, back)
	{
		player.canMove = true;
		text.kill();
		background.kill();
	}
}
