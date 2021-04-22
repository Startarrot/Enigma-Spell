package environment;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxObject;

class Gun extends FlxSprite
{
    public static var SPRITE_WIDTH:Int = 32;
    public static var SPRITE_HEIGHT:Int = 32;

    public var isFound:Bool;

    public function new(X:Float, Y:Float)
        {
            super(X,Y);
            makeGraphic(10,10, FlxColor.ORANGE);
            isFound = false;
        }

    
}