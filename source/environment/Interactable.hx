package environment;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;

class Interactable extends FlxObject
{
    private var gun:FlxSprite;
    private var invGun:FlxSprite;
    public var gunfound:Bool = false;

    public static var SPRITE_WIDTH:Int = 32;
    public static var SPRITE_HEIGHT:Int = 32;


    public function new()
        {
            super();
            gun.super(100,100);
            gun.makeGraphic(10,10, FlxColor.ORANGE);
        }

    // override public function update(elapsed:Float):Void
    //     {
            
    //     }

    public function gunCheck()
    {
        if(gunfound == false)
        {
            gunfound = true;
            gun.makeGraphic(10,10, FlxColor.CYAN);
        }
    }

    override public function update(elapsed:Float):Void
        {
            if(FlxG.keys.justPressed.C)
            {
                //
            }
            if(FlxG.keys.justPressed.C)
            {
                //
            }
        }
}