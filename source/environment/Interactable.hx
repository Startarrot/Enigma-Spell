package environment;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;

class Interactable extends FlxObject
{
    private var obj:FlxSprite;
    private var invObj:FlxSprite;
    public var found:Bool = false;
    public var fText:String;

    public static var SPRITE_WIDTH:Int = 32;
    public static var SPRITE_HEIGHT:Int = 32;


    public function new(X, Y, foundText)
        {
            super(X, Y);
            obj.makeGraphic(10,10, FlxColor.ORANGE);
            fText = foundText;
        }

    override public function update(elapsed:Float):Void
        {
            
        }

    public function getFound()
        {
            return found;
        }
}